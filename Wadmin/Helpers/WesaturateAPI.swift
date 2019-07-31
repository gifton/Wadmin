
import Foundation
import Alamofire

/// API struct that holds all endpoints and static strings necessary for Communicating with api.wesat.co (in development) and api.wesaturate.com (in prod)
/// holds a completion action, and a dispatch group for controlling controller logic method firing timing
/// in corrolation to network call completion
/// standard return objeccts like "photos" and "me" have helper functions built into their specific classes,
/// this class keeps track of URL's, and all calls that arent GET's

class WesaturateAPI {
    public var group: DispatchGroup?
    public var completion: (() -> ())?

    // MARK: endpoints
    private static var _base = "https://api.wesaturate.com/"
    private static let photoBase = "photos"
    private static let me = "me"
    private static let headers: HTTPHeaders = [ "Content-Type": "application/x-www-form-urlencoded" ]
    
    public static var meURL: URL = URL(string: WesaturateAPI._base + WesaturateAPI.me)!
    public static var photosForReview: URL = URL(string: WesaturateAPI._base + "admin/review_photos?per_page=1000")!
    // login: put
    public func login(withEmail email: String, andPassword password: String) {
        group?.enter()
        let parameters = [
            "password" : password,
            "email" : email.lowercased()
        ]
        
        guard let url = URL(string: WesaturateAPI._base + "auth") else { return }
        var validated: Bool = false
        Alamofire.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: WesaturateAPI.headers)
            .responseJSON { (response) in
                
                switch response.result {
                case .success:
                    validated = true
                    self.group?.leave()
                    
                    self.group?.notify(queue: .main, execute: {
                        self.userIsauthenticated = validated
                    })
                default:
                    validated = false
                }
        }
    }
    
    public static func logout() -> Bool {
        guard let url = URL(string: WesaturateAPI._base + "auth") else { return  false}
        var validated = true
        Alamofire.request(url, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: WesaturateAPI.headers)
            .responseJSON { (response) in
                
                switch response.result {
                case .success:
                    validated = false
                default:
                    validated = true
                }
        }
        return validated
    }
    
    
    var userIsauthenticated: Bool = false {
        didSet {
            guard let completion = completion else { return }
            completion()
        }
    }
    
    public static func reviewPhoto(withID id: String, review: Review, completion: @escaping () -> Void) {
        guard let url = URL(string: WesaturateAPI._base + "admin/review_photos/\(id)") else { return }
        print(url)
        let parameters = [
            "state" : review.rawValue
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: WesaturateAPI.headers).response { (response) in
            if response.error == nil {
                completion()
            }
        }
    }
}


enum Review: String {
    case best = "best"
    case approve = "approved"
    case reject = "reject"
    case delete = "delete"
}

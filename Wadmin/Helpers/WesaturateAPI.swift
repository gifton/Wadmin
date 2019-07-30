
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
    // photos
    public static var bestPhotos: URL {
        return URL(string: WesaturateAPI._base + WesaturateAPI.photoBase + "?page=1&per_page=75&status=best")!
    }
    public static var allPhotos: URL {
        return URL(string: WesaturateAPI._base + WesaturateAPI.photoBase)!
    }
    
    public static func search(ForPhoto id: String) -> URL {
        return URL(string: WesaturateAPI._base + WesaturateAPI.photoBase + "/" + id)!
    }
    
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
    
    
    var userIsauthenticated: Bool = false {
        didSet {
            guard let completion = completion else { return }
            completion()
        }
    }
}
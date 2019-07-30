
/*
 login Lifecycle
 confirm email and password existance - checkCredentials()
 confirm email formatted properly     - checkCredentials()
 make network request                 - requestLogin()
 return result                        - login()
 */
import Foundation
import Alamofire

protocol LoginViewmodelDelegate {
    var email: String? { get set }
    var password: String? { get set }
    func login()
    func displayWebView()
}

class LoginViewModel: LoginViewmodelDelegate {
    var email: String?
    
    var password: String?
    var api = WesaturateAPI()
    var output: String = ""
    var group = DispatchGroup()
    var completion: (() -> ())?
    
    public var userIsValidated: Bool {
        return api.userIsauthenticated
    }
    
    internal func login() {
        guard let email = email, let password = password else { return }
        api.group = group
        api.completion = completion
        api.login(withEmail: email, andPassword: password)
        
    }
    
    public func checkCredentials() {
        guard let email = email, let password = password else { return }
        if email.isEmailFormatted() && !password.isEmpty {
            login()
        } else {
            print("failed credential check in VM")
            guard let completion = completion else { return }
            completion()
            return
        }
    }
    
    func displayWebView() {
        print("displaying mobile web for wesaturate signup")
    }
    
    private func setUserInformation() {
        guard let meURL = URL(string: "https://api.wesat.co/me") else { return }
        do {
            let me = try Me(fromURL: meURL)
            let defaults = UserDefaults.standard
            defaults.setValue(UserDefaults.authenticated.authenticated, forKey: UserDefaults.Keys.authenticated)
            defaults.setValue(me.email, forKey: UserDefaults.Keys.userEmail)
            defaults.setValue(me.lastName, forKey: UserDefaults.Keys.userLastName)
            defaults.setValue(me.firstName, forKey: UserDefaults.Keys.userFirstName)
        } catch {
            print(error)
            
        }
        
    }
}

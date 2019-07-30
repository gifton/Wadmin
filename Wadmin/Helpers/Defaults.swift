
import Foundation
extension UserDefaults {
    
    enum Keys {
        
        static let userEmail     = "USEREmail"
        static let userFirstName = "USERFirstName"
        static let userLastName  = "USERLastName"
        static let authenticated = "USERauthenticate"
        
    }
    
    enum authenticated: String {
        case authenticated = "AUTHENTICATED"
        case notAuthenticated = "NOTAUTHENTICATED"
    }
}

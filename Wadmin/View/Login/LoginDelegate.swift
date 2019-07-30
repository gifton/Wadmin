
import Foundation

protocol LoginDelegate {
    func didPressLogin(withEmail email: String, andPassword password: String, completion: @escaping () -> ())
    func didRequestWebsite()
    var userIsValidated: Bool { get }
    
}

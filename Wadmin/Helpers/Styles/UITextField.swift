
import Foundation
import UIKit

// UITextField is where a user can input text
// constrained to a single line, cannot be increased in height to accomodate multiple lines (see UITextView)
//add padding to UITextfield
extension UITextField {
    func addLeftPadding(size: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    
}

// MARK: - Enums
public extension UITextField {
    
    enum TextType {
        /// UITextField is used to enter email addresses.
        case emailAddress
        
        /// UITextField is used to enter passwords.
        case password
        
        /// UITextField is used to enter generic text.
        case generic
        
        // UITextField is used for emoji icon
        case emoji
    }
    
}

// MARK: - Properties
public extension UITextField {
    
    /// Set textField for common text types.
    var textType: TextType {
        get {
            if keyboardType == .emailAddress {
                return .emailAddress
            } else if isSecureTextEntry {
                return .password
            }
            return .generic
        }
        set {
            switch newValue {
            case .emailAddress:
                keyboardType = .emailAddress
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = false
                placeholder = "Email Address"
                
            case .password:
                keyboardType = .asciiCapable
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = true
                placeholder = "Password"
                
            case .generic, .emoji:
                isSecureTextEntry = false
            }
            
        }
    }
    
    /// SwifterSwift: Check if text field is empty.
    var isEmpty: Bool {
        return text?.isEmpty == true
    }
    
    // find if email is valid
    var hasValidEmail: Bool {
        // http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
        return text!.range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
                           options: String.CompareOptions.regularExpression,
                           range: nil, locale: nil) != nil
    }
}



import UIKit

class LoginView: UIView {
    init(withDelegate delegate: LoginDelegate) {
        self.delegate = delegate
        super.init(frame: Device.frame)
        backgroundColor = .white
        styleView(); setView()
    }
    
    // MARK: private objects
    private var sendButton = UIButton()
    private let logo = UIImageView(image: #imageLiteral(resourceName: "activity rings"))
    private var passwordTextField = UITextField()
    private var emailTextField = UITextField()
    
    // MARK: public vars
    public var delegate: LoginDelegate
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleView() {
        sendButton.backgroundColor = Device.colors.primaryBlue
        sendButton.layer.cornerRadius = 4
        sendButton.setTitle("Login", for: .normal)
        sendButton.setTitleColor(.white, for: .normal)
        
        emailTextField.layer.borderColor = UIColor.black.cgColor
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.cornerRadius = 4
        emailTextField.text = "Email"
        emailTextField.font = Device.font.lightBody(ofSize: .xLarge)
        emailTextField.addLeftPadding(size: 50)
        let emailimg = UIImageView(image: #imageLiteral(resourceName: "icons8-important-mail-100"))
        emailimg.frame = CGRect(x: 20, y: 19, width: 18, height: 16)
        emailTextField.addSubview(emailimg)
        
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.cornerRadius = 4
        passwordTextField.text = "Password"
        passwordTextField.font = Device.font.lightBody(ofSize: .xLarge)
        passwordTextField.addLeftPadding(size: 50)
        passwordTextField.isSecureTextEntry = true
        let passImg = UIImageView(image: #imageLiteral(resourceName: "lock-solid"))
        passImg.frame = CGRect(x: 20, y: 19, width: 16, height: 18)
        passwordTextField.addSubview(passImg)
        
        logo.contentMode = .scaleAspectFit
    }
    
    private func setView() {
        // add views
        addSubview(sendButton)
        addSubview(logo)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        
        // set delegates
        passwordTextField.delegate = self
        emailTextField.delegate = self
        
        // set targets
        sendButton.addTapGestureRecognizer(action: askValidation)
        
        // set frames
        logo.frame = CGRect(x: 45, y: 55, width: 45, height: 45)
        emailTextField.frame = CGRect(x: 45, y: logo.bottom + 125, width: Device.width - 100, height: 55)
        passwordTextField.frame = CGRect(x: 45, y: emailTextField.bottom + 25, width: Device.width - 100, height: 55)
        sendButton.frame = CGRect(origin: CGPoint(x: 50, y: passwordTextField.bottom + 100), size: CGSize(width: Device.width - 100, height: 55))
    }
}

// MARK: loginView non-stylistic methods
extension LoginView {
    
    private func askValidation() {
        guard let email = self.emailTextField.text,
            let password = self.passwordTextField.text else {
                self.authenticationFailed(missingContent: true); return
                
        }
        
        self.delegate.didPressLogin(withEmail: email, andPassword: password, completion: {
            switch self.delegate.userIsValidated {
            case true: self.userAuthenticated()
            case false: self.authenticationFailed()
            }
        })
    }
    
    // method for failed login
    private func authenticationFailed(missingContent: Bool = false) {
        print("unable to login from view")
        let lbl = UILabel()
        lbl.textColor = Device.colors.darkGray
        if missingContent {
            lbl.text = "Please fill out both email and password"
        } else {
            lbl.text = "The information given doesnt match a wesaturate pro account"
        }
        
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = Device.font.lightBody()
        lbl.frame = CGRect(x: 45, y: sendButton.top - 50, width: Device.width - 90, height: 35)
        
        addSubview(lbl)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            lbl.removeFromSuperview()
        }
    }
    
    // method for animation for completing signin
    private func userAuthenticated() {
        passwordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        subviews.forEach {
            if !($0.isKind(of: UIImageView.self)) {
                fade(viewOut: $0)
            }
        }
    }
    
    private func fade(viewOut view: UIView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.175) {
            UIView.animate(withDuration: 0.25, animations: {
                view.alpha = 0.0
            })
        }
    }
}

// give controller delegate controll over views textFields
// send data from TF to model for processing and network calls

extension LoginView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

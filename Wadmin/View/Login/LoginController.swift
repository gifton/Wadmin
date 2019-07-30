//
//  LoginController.swift
//  Wesaturate
//
//  Created by Dev on 7/5/19.
//  Copyright © 2019 Wesaturate. All rights reserved.
//

import Foundation
import UIKit

class LoginController: UIViewController {
    init(withModel model: LoginViewModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        loginView = LoginView(withDelegate: self)
        
        view = loginView
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: public vars
    var model: LoginViewModel
    var loginView: LoginView!
    
}

extension LoginController: LoginDelegate {
    
    func didPressLogin(withEmail email: String, andPassword password: String, completion: @escaping () -> ()) {
        model.email = email
        model.password = password
        model.completion = {
            completion()
            if self.model.userIsValidated {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.navigationController?.pushViewController(ViewController(), animated: false)
                })
            }
            
            
        }
        model.checkCredentials()
        
    }
    
    func didRequestWebsite() {
        model.displayWebView()
    }
    
    var userIsValidated: Bool {
        get {
            return model.userIsValidated
        }
    }
    
    
}

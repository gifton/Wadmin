//
//  ViewController.swift
//  Wadmin
//
//  Created by Dev on 7/29/19.
//  Copyright © 2019 Wesaturate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    init(withModel model: HomeViewModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        let home = HomeView()
        home.logoutLabel.addTapGestureRecognizer(action: logout)
        model.countLabel = home.counter.indicator
        view = home
    }
    
    var model: HomeViewModel
    var count: Int = 0
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func logout() {
        print("logging out")
        if WesaturateAPI.logout() {
            print("you have been logged out!")
            navigationController?.popToViewController(LoginController(withModel: LoginViewModel()), animated: true)
        } else {
            print("issue logging out")
        }
    }
    
    
}


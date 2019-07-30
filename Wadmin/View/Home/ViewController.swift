//
//  ViewController.swift
//  Wadmin
//
//  Created by Dev on 7/29/19.
//  Copyright © 2019 Wesaturate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nView = HomeView(withModel: HomeViewModel())
        nView.logoutLabel.addTapGestureRecognizer(action: logout)
        view = nView
    }
    
    func logout() {
        print("logging out")
        if WesaturateAPI.logout() {
            print("you have been logged out!")
        } else {
            print("issue logging out")
        }
    }
}


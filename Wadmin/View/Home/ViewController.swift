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
        let nView = HomeView(frame: Device.frame)
        nView.logoutLabel.addTapGestureRecognizer(action: logout)
        view = nView
        
        // Do any additional setup after loading the view.
        getanalytics()
    }

    func getUserName() {
        do {
            let me = try Me(fromURL: WesaturateAPI.meURL)
            print(me.firstName)
        } catch {
            print(error)
        }
    }
    
    func getanalytics() {
        do {
            let p = try Analytics(fromURL: URL(string: "https://api.wesaturate.com/admin/analytics")!)
            print(p.first?.category)
        } catch {
            print(error)
        }
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


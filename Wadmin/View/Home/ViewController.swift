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
        home.refreshButton.addTapGestureRecognizer(action: model.refresh)
        home.counter.addTapGestureRecognizer(action: showReviews)
        
        model.countLabel = home.counter.indicator
        model.homeAnalyticsView = home.analyticsView
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
            navigationController?.popToViewController(LoginController(withModel: LoginViewModel()), animated: true)
        }
    }
    
    func showReviews() {
        navigationController?.pushViewController(ReviewController(withPhotos: model.photos), animated: true)
    }
    
    
}


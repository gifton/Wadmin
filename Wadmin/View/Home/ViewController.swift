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
        home = HomeView()
        
        home.logoutLabel.addTapGestureRecognizer(action: logout)
        home.counter.addTapGestureRecognizer(action: showReviews)
        
        model.countLabel = home.counter.indicator
        model.homeAnalyticsView = home.analyticsView
        view = home
        
        refreshButton.addTapGestureRecognizer(action: refresh)
    }
    var home: HomeView!
    var model: HomeViewModel
    var count: Int = 0
    var refreshButton: UIButton {
        return home.refreshButton
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func logout() {
        print("logging out")
        if WesaturateAPI.logout() {
            let defaults = UserDefaults.standard
            defaults.setValue(nil, forKey: UserDefaults.Keys.userFirstName)
            defaults.setValue(nil, forKey: UserDefaults.Keys.userLastName)
            defaults.setValue(nil, forKey: UserDefaults.Keys.userEmail)
            defaults.setValue(UserDefaults.authenticated.notAuthenticated.rawValue, forKey: UserDefaults.Keys.authenticated)
            print("admin info reset")
            navigationController?.pushViewController(LoginController(withModel: LoginViewModel()), animated: false)
        }
    }
    
    func showReviews() {
        navigationController?.pushViewController(ReviewController(withPhotos: model.photos), animated: true)
    }
    
    func refresh() {
        print("refreshing")
        refreshButton.addBounceAnimation()
        model.refresh {
            print("refresh confirmed in viewModel")
        }
    }
    
    private func rotateView(targetView: UIView, duration: Double = 1.0) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: CGFloat(Double.pi))
        }) { finished in
            self.rotateView(targetView: targetView, duration: duration)
        }
    }
}


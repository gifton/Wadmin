//
//  Home.swift
//  Wadmin
//
//  Created by Dev on 7/30/19.
//  Copyright © 2019 Wesaturate. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        styleView(); setViews()
        setReviewView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: privatre variables
    private let titleLabel = UILabel()
    private let adminLabel = UILabel()
    private let welcomeLabel = UILabel()
    public let refreshButton = UIButton()
    public let logoutLabel = UILabel()
    private let headBG = UIImageView()
    
    private func styleView() {
        let defaults = UserDefaults.standard
        let name = defaults.string(forKey: UserDefaults.Keys.userFirstName)
        // title
        titleLabel.text = "Wesaturate"
        titleLabel.font = Device.font.title(ofSize: .max)
        titleLabel.sizeToFit()
        // adminf
        adminLabel.text = "Admin"
        adminLabel.font = Device.font.mediumTitle()
        adminLabel.sizeToFit()
        // welcome
        welcomeLabel.text = "Welcome, \(name)"
        welcomeLabel.font = Device.font.mediumTitle(ofSize: .large)
        welcomeLabel.sizeToFit()
        // refresh
        refreshButton.setImage(#imageLiteral(resourceName: "refresh"), for: .normal)
        // logout
        logoutLabel.text = "Logout"
        logoutLabel.textColor = UIColor(hex: "FFA681")
        logoutLabel.font = Device.font.mediumTitle(ofSize: .large)
        logoutLabel.sizeToFit()
        // bg
        headBG.image = #imageLiteral(resourceName: "bg1")
    }
    
    private func setViews() {
        addSubview(headBG)
        addSubview(titleLabel)
        addSubview(adminLabel)
        addSubview(welcomeLabel)
        addSubview(refreshButton)
        addSubview(logoutLabel)
        
        // place objects
        headBG.frame = CGRect(origin: .zero, size: CGSize(width: Device.width, height: 250))
        titleLabel.frame.origin = CGPoint(x: Device.padding.large.rawValue, y: 50)
        adminLabel.frame.origin = CGPoint(x: Device.padding.large.rawValue + 5, y: titleLabel.bottom + 5)
        welcomeLabel.left = Device.padding.large.rawValue
        welcomeLabel.bottom = headBG.bottom - 5
        refreshButton.frame.size = CGSize(width: 30, height: 30)
        refreshButton.center.x = frame.center.x
        refreshButton.bottom = headBG.bottom - 5
        logoutLabel.right = right - 15
        logoutLabel.bottom = headBG.bottom - 5
    }
    
    private func setReviewView() {
        let counter = ReviewCountView(withCount: 29)
        counter.frame.origin = CGPoint(x: Device.padding.large.rawValue, y: headBG.bottom + 15)
        addSubview(counter)
    }
}

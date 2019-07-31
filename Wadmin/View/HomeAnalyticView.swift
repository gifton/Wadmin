//
//  HomeAnanlyticView.swift
//  Wadmin
//
//  Created by Dev on 7/30/19.
//  Copyright © 2019 Wesaturate. All rights reserved.
//

import UIKit

class HomeAnalyticView: UIView {
    init(withStats stats: HomeAnalytics, point: CGPoint) {
        analytics = stats
        
        super.init(frame: CGRect(origin: point, size: CGSize(width: Device.width, height: 130)))
        setViews()
    }
    
    var userPoint = CGPoint(x: 25, y: 0)
    var photoPoint = CGPoint(x: 25, y: 46)
    var referralPoint = CGPoint(x: 25, y: 92)
    
    public func update(toStats stats: HomeAnalytics) {
        print("updating")
        analytics = stats
        subviews.forEach { $0.removeFromSuperview() }
        addSubview(photos)
        addSubview(user)
        addSubview(referral)
    }
    
    
    private var analytics: HomeAnalytics
    var photos: SingleAnalyticView {
        return SingleAnalyticView(analytic: analytics.photos, point: photoPoint)
    }
    var referral: SingleAnalyticView {
        return SingleAnalyticView(analytic: analytics.referral, point: referralPoint)
    }
    var user: SingleAnalyticView {
        return SingleAnalyticView(analytic: analytics.users, point: userPoint)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        addSubview(photos)
        addSubview(user)
        addSubview(referral)
    }
}

//
//  HomeViewModel.swift
//  Wadmin
//
//  Created by Dev on 7/30/19.
//  Copyright © 2019 Wesaturate. All rights reserved.
//


import UIKit

class HomeViewModel: NSObject {
    override init() {
        super.init()
        getAnalytics();
    }
    
    var homeAnalytics: HomeAnalytics?
    var reviewCount: Int = 0 {
        didSet {
            print("reviewCount set to: \(reviewCount)")
            countLabel?.text = String(describing: reviewCount)
        }
    }
    public var countLabel: UILabel? {
        didSet {
            getReviews()
        }
    }
    
    private func getAnalytics() {
        do {
            let analytics = try Analytics(fromURL: URL(string: "https://api.wesaturate.com/admin/analytics")!)
            homeAnalytics = analytics.getHomeAnalytics()
        } catch {
            print(error)
        }
    }
    
    
    private func getReviews() {
        do {
            let photos = try Photos(fromURL: WesaturateAPI.photosForReview)
            print(photos.count)
            countLabel?.text = String(describing: photos.count)
        } catch { print(error)}
    }
    
    public func refresh(completion: () -> Void) {
        getReviews()
        getAnalytics()
        completion()
    }
}


enum HomeAnalytic: String {
    case referral = "Referral clicks"
    case totalPhotos = "Total photos"
    case totalUsers = "Users"
}

struct HomeAnalytics {
    init(referral: Analytic, photos: Analytic, users: Analytic) {
        self.referral = referral
        self.photos = photos
        self.users = users
    }
    
    var referral: Analytic
    var photos: Analytic
    var users: Analytic
    
}


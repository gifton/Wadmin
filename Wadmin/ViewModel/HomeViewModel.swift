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
    }
    
    var homeAnalytics: HomeAnalytics? {
        didSet {
            homeAnalyticsView?.update(toStats: homeAnalytics!)
        }
    }
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
    
    public var homeAnalyticsView: HomeAnalyticView? {
        didSet {
            getAnalytics()
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
    
    public var photos: Photos?
    
    private func getReviews() {
        do {
            let photos = try Photos(fromURL: WesaturateAPI.photosForReview)
            self.photos = photos
            countLabel?.text = String(describing: photos.count)
            countLabel?.addBounceAnimation()
        } catch { print(error)}
    }
    
    public func refresh(_ completion: () -> Void) {
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
    
    static var zero: HomeAnalytics {
        let an = Analytic(stat: Stat.string("Not available"), category: Category.photos, name: "Not available")
        return HomeAnalytics(referral: an, photos: an, users: an)
    }
    
}


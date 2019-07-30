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
        getAnalytics()
    }
    
    var homeAnalytics: HomeAnalytics? 
    
    private func getAnalytics() {
        do {
            let analytics = try Analytics(fromURL: URL(string: "https://api.wesaturate.com/admin/analytics")!)
            homeAnalytics = analytics.getHomeAnalytics()
        } catch {
            print(error)
        }
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


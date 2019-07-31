//
//  ReviewCellViewModel.swift
//  Wadmin
//
//  Created by Dev on 7/30/19.
//  Copyright © 2019 Wesaturate. All rights reserved.
//

import UIKit

class ReviewCellVIewModel: NSObject {
    init(withPhotos photos: Photos) {
        self.photos = photos
        super.init()
    }
    
    var photos: Photos
    var count: Int { return photos.count }
    
    func approve(photoWithID id: String) {
        
    }
    
    public func refresh() {
        do {
            photos = try Photos(fromURL: WesaturateAPI.photosForReview)
        } catch { print(error) }
        
    }
}

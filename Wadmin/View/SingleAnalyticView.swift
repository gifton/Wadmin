//
//  SingleAnanlyticView.swift
//  Wadmin
//
//  Created by Dev on 7/30/19.
//  Copyright © 2019 Wesaturate. All rights reserved.
//

import UIKit

class SingleAnalyticView: UIView {
    init(analytic: Analytic, point: CGPoint) {
        self.analytic = analytic
        super.init(frame: CGRect(origin: point, size: CGSize(width: 315, height: 36)))
        setView()
        style()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var analytic: Analytic
    private var titleLabel = UILabel()
    private var photo = UIImageView()
    private var stat = UILabel()
    
    private func setView() {
        
        titleLabel.text = analytic.name
        titleLabel.sizeToFit()
        titleLabel.textColor = .lightGray
        
        photo.contentMode = .scaleAspectFit
        var statText: String = String(describing: analytic.stat)
        statText.removeAll { (char) -> Bool in
            char.isNumber != true
        }
        stat.text = statText
        stat.font = Device.font.mediumTitle(ofSize: .large)
        stat.sizeToFit()
        switch analytic.category {
        case .finance: photo.image = #imageLiteral(resourceName: "network")
        case .photos: photo.image = #imageLiteral(resourceName: "camera")
        case .users: photo.image = #imageLiteral(resourceName: "person")
        }
    }
    
    private func style() {
        layer.cornerRadius = 5
        layer.masksToBounds = true
        backgroundColor = UIColor(hex: "F4F4F5")
        photo.frame = CGRect(x: 15, y: 8, width: 20, height: 20)
        titleLabel.frame.origin = CGPoint(x: photo.right + 15, y: 8)
        
        stat.frame.origin = CGPoint(x: width - stat.width - 15, y: 8)
        
        addSubview(photo)
        addSubview(titleLabel)
        addSubview(stat)
    }
}

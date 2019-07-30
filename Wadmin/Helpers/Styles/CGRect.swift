
import Foundation
import UIKit

extension CGRect {
    /// The top coordinate of the rect.
    public var top: CGFloat {
        get {
            return origin.y
        }
        set(value) {
            origin.y = value
        }
    }
    
    // The left-side coordinate of the rect.
    public var left: CGFloat {
        get {
            return origin.x
        }
        set(value) {
            origin.x = value
        }
    }
    
    // The bottom coordinate of the rect. Setting this will change origin.y of the rect according to
    // the height of the rect.
    public var bottom: CGFloat {
        get {
            return origin.y + size.height
        }
        set(value) {
            origin.y = value - size.height
        }
    }
    
    // The right-side coordinate of the rect. Setting this will change origin.x of the rect according to
    // the width of the rect.
    public var right: CGFloat {
        get {
            return origin.x + size.width
        }
        set(value) {
            origin.x = value - size.width
        }
    }
    
    // The center x coordinate of the rect.
    public var centerX: CGFloat {
        get {
            return origin.x + size.width / 2
        }
        set (value) {
            origin.x = value - size.width / 2
        }
    }
    
    // The center y coordinate of the rect.
    public var centerY: CGFloat {
        get {
            return origin.y + size.height / 2
        }
        set (value) {
            origin.y = value - size.height / 2
        }
    }
    
    // The center of the rect.
    public var center: CGPoint {
        get {
            return CGPoint(x: centerX, y: centerY)
        }
        set (value) {
            centerX = value.x
            centerY = value.y
        }
    }
}

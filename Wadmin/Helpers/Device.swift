
import Foundation
import UIKit

// Device stors all our global static values for things like:
// font
// sizing
// font size
// colors

struct Device {
    static let width  = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let frame  = UIScreen.main.bounds
    
    enum profileIconDiameter: CGFloat {
        case small = 27.0
        case large = 85.0
    }
    
    enum padding: CGFloat {
        case small   = 5.0
        case medium  = 10.0
        case large   = 12.0
        case xlarge  = 25.0
    }
    
    enum fontSize: CGFloat {
        case xSmall  = 10.0
        case small   = 12.0
        case medium  = 14.0
        case large   = 16.0
        case xLarge  = 18.0
        case xXLarge = 22.0
        case max     = 32.0
    }
    
    struct font {
        static func title(ofSize: fontSize = fontSize.xXLarge) -> UIFont {
            return UIFont.systemFont(ofSize: ofSize.rawValue, weight: .bold)
        }
        static func mediumTitle(ofSize: fontSize = fontSize.xLarge) -> UIFont {
            return UIFont.systemFont(ofSize: ofSize.rawValue, weight: .medium)
        }
        static func body(ofSize: fontSize = fontSize.medium) -> UIFont {
            return UIFont.systemFont(ofSize: ofSize.rawValue, weight: .regular)
        }
        static func lightBody(ofSize: fontSize = fontSize.small) -> UIFont {
            return UIFont.systemFont(ofSize: ofSize.rawValue, weight: .light)
        }
    }
    
    struct colors {
        // background
        static let primaryPink   = UIColor(hex: "F4EAEA")
        static let darkGray      = UIColor(hex: "161616")
        static let lightGray     = UIColor(hex: "EDEEEF")
        
        // text
        static let offWhite      = UIColor(hex: "FBF6EB")
        static let primaryPurple = UIColor(hex: "553F5E")
        
        // misc
        static let primaryBlue   = UIColor(hex: "6271FC")
        static let secondaryBlue = UIColor(hex: "7E86B7")
        static let secondaryGray = UIColor(hex: "A3A0A0")
        
    }
}

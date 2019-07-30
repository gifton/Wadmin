
import Foundation
import UIKit

extension String {
    //calculate height of text word wrapped to device width
    func sizeFor(font: UIFont, width: CGFloat) -> CGSize{
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = self
        label.sizeToFit()
        
        return label.frame.size
    }
    
    // check if ounctuation is used (helpful for sperating tags)
    var hasPunctuationCharacters: Bool {
        return rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil
    }
    
    //Regex fulfill RFC 5322 Internet Message format
    func isEmailFormatted() -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(\\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@([A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?\\.)+[A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?")
        return predicate.evaluate(with: self)
    }
}

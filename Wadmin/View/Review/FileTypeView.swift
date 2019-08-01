
import UIKit

class FileTypeIndicator: UIView {
    init(point: CGPoint, rawType: String) {
        type = rawType
        super.init(frame: CGRect(origin: point, size: CGSize(width: 100, height: 40)))
        
        styleView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var type: String
    
    private func styleView() {
        blurBackground(type: .regular)
        layer.opacity = 0.9
        layer.cornerRadius = 4
        layer.masksToBounds = true
        
        // jpeg
        let JPGLabel = UILabel()
        JPGLabel.text = "JPEG"
        JPGLabel.font = Device.font.title(ofSize: .medium)
        JPGLabel.sizeToFit()
        JPGLabel.frame.origin = CGPoint(x: 10, y: 12)
        
        // raw
        let RAWLabel = UILabel()
        RAWLabel.text = type
        RAWLabel.font = Device.font.title(ofSize: .medium)
        RAWLabel.sizeToFit()
        RAWLabel.frame.origin = CGPoint(x: JPGLabel.right + 10, y: 12)
        
        addSubview(JPGLabel)
        addSubview(RAWLabel)
    }
}

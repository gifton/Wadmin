
import UIKit

protocol ReviewCountDelegate {
    func update(toCount: Int)
}

class ReviewCountView: UIView {
    init(withCount count: Int) {
        self.count = count
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: 235, height: 60)))
        setView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(toCount: Int) {
        self.indicator.text = String(describing: toCount)
    }
    
    var count: Int {
        didSet {
            self.indicator.text = String(describing: count)
        }
    }
    
    // MARK: private variables
    public let indicator = UILabel()
    private let toReviewLabel = UILabel()
    private let toReviewButton = UIButton()
    
    
    private func setView() {
        indicator.frame = CGRect(origin: CGPoint(x: 10, y: 0), size: CGSize(width: 60, height: 60))
        indicator.backgroundColor = Device.colors.darkGray
        indicator.layer.cornerRadius = 30
        indicator.layer.masksToBounds = true
        indicator.textAlignment = .center
        indicator.text = String(describing: count)
        indicator.adjustsFontSizeToFitWidth = true
        indicator.textColor = .white
        
        addSubview(indicator)
        
        toReviewLabel.text = "Review Photos →"
        toReviewLabel.sizeToFit()
        toReviewLabel.font = Device.font.title(ofSize: .large)
        toReviewLabel.left = indicator.right + 5
        toReviewLabel.center.y = indicator.center.y
        
        addSubview(toReviewLabel)
    }
}

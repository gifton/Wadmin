
import UIKit


class ReviewCountView: UIView {
    init(withCount count: Int) {
        self.count = count
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: 235, height: 60)))
        setView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var count: Int
    
    
    // MARK: private variables
    private let indicator = UILabel()
    private let toReviewLabel = UILabel()
    private let toReviewButton = UIButton()
    
    
    private func setView() {
        indicator.frame = CGRect(origin: .zero, size: CGSize(width: 60, height: 60))
        indicator.backgroundColor = .black
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

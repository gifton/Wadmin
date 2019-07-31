
import UIKit
import Kingfisher

class ReviewCard: CardView {
    
    override init(frame: CGRect, model: ReviewCardViewModel) {
        super.init(frame: frame, model: model)
        
        // image
        let imageView = UIImageView()
        imageView.kf.setImage(with: model.imageLink)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = Device.colors.primaryPurple
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: 12, y: 12, width: self.frame.width - 24, height: self.frame.height - 103)
        self.addSubview(imageView)
        
        // dummy text boxes
        let textBox1 = UIView()
        textBox1.backgroundColor = Device.colors.primaryPurple
        textBox1.layer.cornerRadius = 12
        textBox1.layer.masksToBounds = true
        
        textBox1.frame = CGRect(x: 12, y: imageView.frame.maxY + 15, width: 200, height: 24)
        self.addSubview(textBox1)
        
        let textBox2 = UIView()
        textBox2.backgroundColor = Device.colors.primaryPurple
        textBox2.layer.cornerRadius = 12
        textBox2.layer.masksToBounds = true
        
        textBox2.frame = CGRect(x: 12, y: textBox1.frame.maxY + 10, width: 120, height: 24)
        self.addSubview(textBox2)
    }
    
    func sendAdminReview() -> Bool {
        return sendReview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

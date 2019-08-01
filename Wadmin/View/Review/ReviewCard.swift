
import UIKit
import Kingfisher

class ReviewCard: CardView {
    let imageView = UIImageView()
    override init(frame: CGRect, model: ReviewCardViewModel) {
        super.init(frame: frame, model: model)
        
        // image
        imageView.kf.setImage(with: model.imageLink)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = Device.colors.primaryPurple
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: 12, y: 12, width: self.frame.width - 24, height: self.frame.height - 103)
        self.addSubview(imageView)
        
        setOrigionality(isOrigional: model.isOrigional)
        set(user: model.username)
        set(model.dimensions)
        set(imageDate: model.date)
        setFileTypeInfo(withType: model.fileType)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setOrigionality(isOrigional: Bool) {
        let lbl = UILabel()
        lbl.font = Device.font.title()
        lbl.textColor = Device.colors.offWhite
        lbl.addShadow(offset: CGSize(width: 2, height: 2))
        if isOrigional {
            lbl.text = "Origional"
        } else {
            lbl.text = "Edit"
        }
        lbl.sizeToFit()
        lbl.frame.origin = CGPoint(x: width - lbl.width - 15 - 12, y: bottom - lbl.height - 25)
        addSubview(lbl)
    }
    
    private func set(user name: String) {
        let lbl = UILabel()
        lbl.font = Device.font.mediumTitle(ofSize: .medium)
        lbl.textColor = Device.colors.darkGray
        lbl.text = "/" + name
        lbl.sizeToFit()
        lbl.frame.origin = CGPoint(x: left + 15, y: imageView.bottom + 12)
        addSubview(lbl)
    }
    
    private func set(_ dimensions: String) {
        let lbl = UILabel()
        lbl.font = Device.font.body(ofSize: .medium)
        lbl.textColor = Device.colors.darkGray
        lbl.text = dimensions
        lbl.sizeToFit()
        lbl.frame.origin = CGPoint(x: left + 15, y: imageView.bottom + 12 + 35)
        addSubview(lbl)
    }
    
    private func set(imageDate date: String) {
        let lbl = UILabel()
        lbl.font = Device.font.body(ofSize: .medium)
        lbl.textColor = Device.colors.darkGray
        lbl.text = date
        lbl.sizeToFit()
        lbl.frame.origin = CGPoint(x: right - lbl.width - 12 - 5, y: imageView.bottom + 12)
        addSubview(lbl)
    }
    
    private func setFileTypeInfo(withType type: String) {
        let outView = FileTypeIndicator(point: CGPoint(x: right - 100 - 15 - 12, y: imageView.bottom - 40 - 15), rawType: type)
        addSubview(outView)
    }
    
}

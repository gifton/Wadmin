
import UIKit

class ImageCardViewModel: NSObject {
    init(withPhoto photo: Photo) {
        self.photo = photo
        super.init()
    }
    
    private var photo: Photo
    
    public var imageLink: URL {
        return URL(string: photo.links.medium)!
    }
    public var dimensions: String {
        return "\(photo.height) x \(photo.width)"
    }
    public var camType: String {
        return photo.exif.model ?? "not available"
    }
    public var id: String {
        return photo.id
    }
    
    func review(_ review: Review) {
        WesaturateAPI.reviewPhoto(withID: photo.id, review: review) { (true) in
            print("worked!")
        }
    }
}


import UIKit

class ReviewCardViewModel: NSObject {
    init(withPhoto photo: Photo) {
        self.photo = photo
        super.init()
    }
    
    private var photo: Photo
    
    public var imageLink: URL {
        return URL(string: photo.links.small)!
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
    
    func review(_ review: Review) -> Bool {
        var complete = false
        WesaturateAPI.reviewPhoto(withID: id, review: review) { (success) in
            print("worked?: \(success)")
            complete = success
        }
        return complete
    }
}

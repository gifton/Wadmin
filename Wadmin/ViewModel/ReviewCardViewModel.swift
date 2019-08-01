
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
    public var username: String {
        return photo.user.username
    }
    public var isOrigional: Bool {
        return (photo.cantFindOriginal)
    }
    public var date: String {
        return photo.createdAt
    }
    public var fileType: String {
        return photo.rawFileType
    }
    
    func review(_ review: Review, completion: @escaping () -> Void) {
        WesaturateAPI.reviewPhoto(withID: id, review: review) {
            completion()
        }
    }
}

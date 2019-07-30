
import Foundation

// MARK: - Me
class Me: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let username: String
    let site: String
    let location: String
    let bio: String
    let avatar: String
    let createdAt: Date
    let email: String
    let emailPhotoStatus: Bool
    let emailNews: Bool
    let emailMilestones: Bool
    let photosUploadedToday: Int
    let admin: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case username = "username"
        case site = "site"
        case location = "location"
        case bio = "bio"
        case avatar = "avatar"
        case createdAt = "created_at"
        case email = "email"
        case emailPhotoStatus = "email_photo_status"
        case emailNews = "email_news"
        case emailMilestones = "email_milestones"
        case photosUploadedToday = "photos_uploaded_today"
        case admin = "admin"
    }
    
    init(id: String, firstName: String, lastName: String, username: String, site: String, location: String, bio: String, avatar: String, createdAt: Date, email: String, emailPhotoStatus: Bool, emailNews: Bool, emailMilestones: Bool, photosUploadedToday: Int, admin: Bool) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.site = site
        self.location = location
        self.bio = bio
        self.avatar = avatar
        self.createdAt = createdAt
        self.email = email
        self.emailPhotoStatus = emailPhotoStatus
        self.emailNews = emailNews
        self.emailMilestones = emailMilestones
        self.photosUploadedToday = photosUploadedToday
        self.admin = admin
    }
}

// MARK: Me convenience initializers and mutators

extension Me {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Me.self, from: data)
        self.init(id: me.id, firstName: me.firstName, lastName: me.lastName, username: me.username, site: me.site, location: me.location, bio: me.bio, avatar: me.avatar, createdAt: me.createdAt, email: me.email, emailPhotoStatus: me.emailPhotoStatus, emailNews: me.emailNews, emailMilestones: me.emailMilestones, photosUploadedToday: me.photosUploadedToday, admin: me.admin)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        id: String? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        username: String? = nil,
        site: String? = nil,
        location: String? = nil,
        bio: String? = nil,
        avatar: String? = nil,
        createdAt: Date? = nil,
        email: String? = nil,
        emailPhotoStatus: Bool? = nil,
        emailNews: Bool? = nil,
        emailMilestones: Bool? = nil,
        photosUploadedToday: Int? = nil,
        admin: Bool? = nil
        ) -> Me {
        return Me(
            id: id ?? self.id,
            firstName: firstName ?? self.firstName,
            lastName: lastName ?? self.lastName,
            username: username ?? self.username,
            site: site ?? self.site,
            location: location ?? self.location,
            bio: bio ?? self.bio,
            avatar: avatar ?? self.avatar,
            createdAt: createdAt ?? self.createdAt,
            email: email ?? self.email,
            emailPhotoStatus: emailPhotoStatus ?? self.emailPhotoStatus,
            emailNews: emailNews ?? self.emailNews,
            emailMilestones: emailMilestones ?? self.emailMilestones,
            photosUploadedToday: photosUploadedToday ?? self.photosUploadedToday,
            admin: admin ?? self.admin
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

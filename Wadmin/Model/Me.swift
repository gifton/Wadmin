//   let me = try Me(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.meTask(with: url) { me, response, error in
//     if let me = me {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Me
struct Me: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let username: String
    let site: String
    let location: String
    let bio: String
    let avatar: String
    let createdAt: String
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
}

// MARK: Me convenience initializers and mutators

extension Me {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Me.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
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
        createdAt: String? = nil,
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

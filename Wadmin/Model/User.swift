
import Foundation

//
// To read values from URLs:
//
//   let task = URLSession.shared.userTask(with: url) { user, response, error in
//     if let user = user {
//       ...
//     }
//   }
//   task.resume()

// MARK: - User
class User: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let username: String
    let site: String
    let location: String
    let bio: String
    let avatar: String
    let createdAt: String
    
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
    }
    
    init(id: String, firstName: String, lastName: String, username: String, site: String, location: String, bio: String, avatar: String, createdAt: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.site = site
        self.location = location
        self.bio = bio
        self.avatar = avatar
        self.createdAt = createdAt
    }
}

// MARK: User convenience initializers and mutators

extension User {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(User.self, from: data)
        self.init(id: me.id, firstName: me.firstName, lastName: me.lastName, username: me.username, site: me.site, location: me.location, bio: me.bio, avatar: me.avatar, createdAt: me.createdAt)
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
        createdAt: String? = nil
        ) -> User {
        return User(
            id: id ?? self.id,
            firstName: firstName ?? self.firstName,
            lastName: lastName ?? self.lastName,
            username: username ?? self.username,
            site: site ?? self.site,
            location: location ?? self.location,
            bio: bio ?? self.bio,
            avatar: avatar ?? self.avatar,
            createdAt: createdAt ?? self.createdAt
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

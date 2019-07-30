// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photos = try Photos(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.photoTask(with: url) { photo, response, error in
//     if let photo = photo {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Photo
class Photo: Codable {
    let id: String
    let userID: String
    let rawFileType: String
    let width: Int
    let height: Int
    let reviewed: Bool
    let downloads: Int
    let views: Int
    let likes: Int
    let approved: Bool
    let best: Bool
    let exif: Exif
    let tags: String
    let geoX: Int
    let geoY: Int
    let location: String
    let cantFindOriginal: Bool
    let createdAt: String
    let links: Links
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case userID = "user_id"
        case rawFileType = "raw_file_type"
        case width = "width"
        case height = "height"
        case reviewed = "reviewed"
        case downloads = "downloads"
        case views = "views"
        case likes = "likes"
        case approved = "approved"
        case best = "best"
        case exif = "exif"
        case tags = "tags"
        case geoX = "geo_x"
        case geoY = "geo_y"
        case location = "location"
        case cantFindOriginal = "cant_find_original"
        case createdAt = "created_at"
        case links = "links"
        case user = "user"
    }
    
    init(id: String, userID: String, rawFileType: String, width: Int, height: Int, reviewed: Bool, downloads: Int, views: Int, likes: Int, approved: Bool, best: Bool, exif: Exif, tags: String, geoX: Int, geoY: Int, location: String, cantFindOriginal: Bool, createdAt: String, links: Links, user: User) {
        self.id = id
        self.userID = userID
        self.rawFileType = rawFileType
        self.width = width
        self.height = height
        self.reviewed = reviewed
        self.downloads = downloads
        self.views = views
        self.likes = likes
        self.approved = approved
        self.best = best
        self.exif = exif
        self.tags = tags
        self.geoX = geoX
        self.geoY = geoY
        self.location = location
        self.cantFindOriginal = cantFindOriginal
        self.createdAt = createdAt
        self.links = links
        self.user = user
    }
}

// MARK: Photo convenience initializers and mutators

extension Photo {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Photo.self, from: data)
        self.init(id: me.id, userID: me.userID, rawFileType: me.rawFileType, width: me.width, height: me.height, reviewed: me.reviewed, downloads: me.downloads, views: me.views, likes: me.likes, approved: me.approved, best: me.best, exif: me.exif, tags: me.tags, geoX: me.geoX, geoY: me.geoY, location: me.location, cantFindOriginal: me.cantFindOriginal, createdAt: me.createdAt, links: me.links, user: me.user)
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
        userID: String? = nil,
        rawFileType: String? = nil,
        width: Int? = nil,
        height: Int? = nil,
        reviewed: Bool? = nil,
        downloads: Int? = nil,
        views: Int? = nil,
        likes: Int? = nil,
        approved: Bool? = nil,
        best: Bool? = nil,
        exif: Exif? = nil,
        tags: String? = nil,
        geoX: Int? = nil,
        geoY: Int? = nil,
        location: String? = nil,
        cantFindOriginal: Bool? = nil,
        createdAt: String? = nil,
        links: Links? = nil,
        user: User? = nil
        ) -> Photo {
        return Photo(
            id: id ?? self.id,
            userID: userID ?? self.userID,
            rawFileType: rawFileType ?? self.rawFileType,
            width: width ?? self.width,
            height: height ?? self.height,
            reviewed: reviewed ?? self.reviewed,
            downloads: downloads ?? self.downloads,
            views: views ?? self.views,
            likes: likes ?? self.likes,
            approved: approved ?? self.approved,
            best: best ?? self.best,
            exif: exif ?? self.exif,
            tags: tags ?? self.tags,
            geoX: geoX ?? self.geoX,
            geoY: geoY ?? self.geoY,
            location: location ?? self.location,
            cantFindOriginal: cantFindOriginal ?? self.cantFindOriginal,
            createdAt: createdAt ?? self.createdAt,
            links: links ?? self.links,
            user: user ?? self.user
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}



import Foundation


//
// To read values from URLs:
//
//   let task = URLSession.shared.linksTask(with: url) { links, response, error in
//     if let links = links {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Links
class Links: Codable {
    let full: String
    let large: String
    let medium: String
    let small: String
    let tiny: String
    let raw: String?
    
    enum CodingKeys: String, CodingKey {
        case full = "full"
        case large = "large"
        case medium = "medium"
        case small = "small"
        case tiny = "tiny"
        case raw = "raw"
    }
    
    init(full: String, large: String, medium: String, small: String, tiny: String, raw: String?) {
        self.full = full
        self.large = large
        self.medium = medium
        self.small = small
        self.tiny = tiny
        self.raw = raw
    }
}

// MARK: Links convenience initializers and mutators

extension Links {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Links.self, from: data)
        self.init(full: me.full, large: me.large, medium: me.medium, small: me.small, tiny: me.tiny, raw: me.raw)
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
        full: String? = nil,
        large: String? = nil,
        medium: String? = nil,
        small: String? = nil,
        tiny: String? = nil,
        raw: String?? = nil
        ) -> Links {
        return Links(
            full: full ?? self.full,
            large: large ?? self.large,
            medium: medium ?? self.medium,
            small: small ?? self.small,
            tiny: tiny ?? self.tiny,
            raw: raw ?? self.raw
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

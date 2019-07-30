//
//  Analytics.swift
//  Wadmin
//
//  Created by Dev on 7/30/19.
//  Copyright © 2019 Wesaturate. All rights reserved.
//

import Foundation

// MARK: - Analytic
class Analytic: Codable {
    let stat: Stat
    let category: Category
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case stat = "stat"
        case category = "category"
        case name = "name"
    }
    
    init(stat: Stat, category: Category, name: String) {
        self.stat = stat
        self.category = category
        self.name = name
    }
}

// MARK: Analytic convenience initializers and mutators

extension Analytic {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Analytic.self, from: data)
        self.init(stat: me.stat, category: me.category, name: me.name)
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
        stat: Stat? = nil,
        category: Category? = nil,
        name: String? = nil
        ) -> Analytic {
        return Analytic(
            stat: stat ?? self.stat,
            category: category ?? self.category,
            name: name ?? self.name
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Category: String, Codable {
    case finance = "Finance"
    case photos = "Photos"
    case users = "Users"
}

enum Stat: Codable {
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Stat.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Stat"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

typealias Analytics = [Analytic]

extension Array where Element == Analytics.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Analytics.self, from: data)
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
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}


import Foundation

//
// To read values from URLs:
//
//   let task = URLSession.shared.exifTask(with: url) { exif, response, error in
//     if let exif = exif {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Exif
class Exif: Codable {
    let make: String?
    let model: String?
    let exposureTime: String?
    let aperture: String?
    let focalLength: String?
    let iso: Int?
    let lensMake: String?
    let lensModel: String?
    
    enum CodingKeys: String, CodingKey {
        case make = "make"
        case model = "model"
        case exposureTime = "exposure_time"
        case aperture = "aperture"
        case focalLength = "focal_length"
        case iso = "iso"
        case lensMake = "lens_make"
        case lensModel = "lens_model"
    }
    
    init(make: String?, model: String?, exposureTime: String?, aperture: String?, focalLength: String?, iso: Int?, lensMake: String?, lensModel: String?) {
        self.make = make
        self.model = model
        self.exposureTime = exposureTime
        self.aperture = aperture
        self.focalLength = focalLength
        self.iso = iso
        self.lensMake = lensMake
        self.lensModel = lensModel
    }
}

// MARK: Exif convenience initializers and mutators

extension Exif {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Exif.self, from: data)
        self.init(make: me.make, model: me.model, exposureTime: me.exposureTime, aperture: me.aperture, focalLength: me.focalLength, iso: me.iso, lensMake: me.lensMake, lensModel: me.lensModel)
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
        make: String?? = nil,
        model: String?? = nil,
        exposureTime: String?? = nil,
        aperture: String?? = nil,
        focalLength: String?? = nil,
        iso: Int?? = nil,
        lensMake: String?? = nil,
        lensModel: String?? = nil
        ) -> Exif {
        return Exif(
            make: make ?? self.make,
            model: model ?? self.model,
            exposureTime: exposureTime ?? self.exposureTime,
            aperture: aperture ?? self.aperture,
            focalLength: focalLength ?? self.focalLength,
            iso: iso ?? self.iso,
            lensMake: lensMake ?? self.lensMake,
            lensModel: lensModel ?? self.lensModel
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

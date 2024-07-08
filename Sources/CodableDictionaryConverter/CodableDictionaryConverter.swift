// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public extension Decodable {
    init(dictionary: [AnyHashable : Any]) throws {
        let data = try JSONSerialization.data(withJSONObject: dictionary)
        self = try JSONDecoder().decode(Self.self, from: data)
    }
}

public extension Encodable {
    func toDictionary() throws -> [AnyHashable : Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data) as? [AnyHashable : Any]
        else {
            throw EncodingError.invalidValue(self, .init(codingPath: [], debugDescription: "Could not convert to dictionary"))
        }
        return dictionary
    }
}

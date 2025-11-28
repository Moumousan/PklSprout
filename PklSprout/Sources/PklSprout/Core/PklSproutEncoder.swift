//
//  PklSproutEncoder.swift
//  PklSprout
//
//  Created by SNI on 2025/10/19.
//


//
//  PklSproutEncoder.swift
//  PklSprout
//
//  Encodes Codable structures into .pkl format (property-key style)

import Foundation

public struct PklSproutEncoder {
    public static func encode<T: Encodable>(_ value: T) throws -> String {
        let data = try JSONEncoder().encode(value)
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw EncodingError.invalidValue(value, .init(codingPath: [], debugDescription: "Not a dictionary"))
        }
        return render(json, indent: 0)
    }

    private static func render(_ dict: [String: Any], indent: Int) -> String {
        var result = ""
        let pad = String(repeating: " ", count: indent)
        for (key, value) in dict.sorted(by: { $0.key < $1.key }) {
            switch value {
            case let sub as [String: Any]:
                result += "\(pad)\(key):\n"
                result += render(sub, indent: indent + 2)
            case let arr as [Any]:
                let arrText = arr.map { "\($0)" }.joined(separator: ", ")
                result += "\(pad)\(key): [\(arrText)]\n"
            default:
                result += "\(pad)\(key): \(value)\n"
            }
        }
        return result
    }
}
//
//  PklSproutDecoder.swift
//  PklSprout
//
//  Created by SNI on 2025/10/19.
//


//
//  PklSproutDecoder.swift
//  PklSprout
//
//  Decodes .pkl formatted text back into Codable objects.
//

import Foundation

public struct PklSproutDecoder {
    public static func decode<T: Decodable>(_ type: T.Type, from text: String) throws -> T {
        let lines = text.split(separator: "\n")
        var dict: [String: Any] = [:]
        for line in lines {
            let parts = line.split(separator: ":", maxSplits: 1)
            guard parts.count == 2 else { continue }
            let key = String(parts[0]).trimmingCharacters(in: .whitespaces)
            var value = String(parts[1]).trimmingCharacters(in: .whitespaces)
            if value.hasPrefix("[") {
                value.removeFirst()
                value.removeLast()
                let arr = value.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
                dict[key] = arr
            } else {
                dict[key] = value
            }
        }
        let data = try JSONSerialization.data(withJSONObject: dict)
        return try JSONDecoder().decode(type, from: data)
    }
}
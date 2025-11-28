//
//  PklValueType.swift
//  PklSprout
//
//  Created by SNI on 2025/10/19.
//


//
//  PklValueType.swift
//  PklSprout
//
//  Common type representing a key-value pair node.
//

import Foundation

public enum PklValueType: Equatable, CustomStringConvertible {
    case string(String)
    case number(Double)
    case bool(Bool)
    case array([PklValueType])
    case dict([String: PklValueType])

    public var description: String {
        switch self {
        case .string(let s): return s
        case .number(let n): return String(n)
        case .bool(let b): return String(b)
        case .array(let arr): return "[\(arr.map(\.description).joined(separator: ", "))]"
        case .dict(let d): return d.map { "\($0.key): \($0.value)" }.joined(separator: ", ")
        }
    }
}
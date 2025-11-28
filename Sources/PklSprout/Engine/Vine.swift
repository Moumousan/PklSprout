//
//  Vine.swift
//  PklSprout
//
//  Created by SNI on 2025/10/19.
//


//
//  Vine.swift
//  PklSprout
//

import Foundation

public struct Vine: Identifiable, Hashable {
    public let id = UUID()
    public let from: UUID
    public let to: UUID
    public var label: String
}
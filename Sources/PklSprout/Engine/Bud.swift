//
//  Bud.swift
//  PklSprout
//
//  Created by SNI on 2025/10/19.
//


//
//  Bud.swift
//  PklSprout
//

import Foundation

@MainActor
public final class Bud: Identifiable, ObservableObject {
    public let id = UUID()
    @Published public var label: String
    @Published public var vines: [Vine] = []

    public init(label: String) {
        self.label = label
    }

    public func addVine(_ vine: Vine) {
        vines.append(vine)
    }
}
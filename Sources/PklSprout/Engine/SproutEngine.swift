//
//  SproutEngine.swift
//  PklSprout
//
//  Created by SNI on 2025/10/19.
//


//
//  SproutEngine.swift
//  PklSprout
//
//  Core engine managing buds (nodes) and vines (links)
//

import Foundation

@MainActor
public final class SproutEngine: ObservableObject {
    @Published public var buds: [Bud] = []

    public init() {}

    public func addBud(_ bud: Bud) {
        buds.append(bud)
    }

    public func connect(_ from: Bud.ID, to target: Bud.ID, label: String = "") {
        guard let source = buds.first(where: { $0.id == from }),
              let destination = buds.first(where: { $0.id == target }) else { return }
        source.addVine(Vine(from: source.id, to: destination.id, label: label))
    }
}
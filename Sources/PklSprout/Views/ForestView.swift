//
//  ForestView.swift
//  PklSprout
//
//  Created by SNI on 2025/10/19.
//


//
//  ForestView.swift
//  PklSprout
//
//  Simple placeholder for visualizing buds and vines
//

import SwiftUI

public struct ForestView: View {
    @ObservedObject var engine: SproutEngine

    public init(engine: SproutEngine) {
        self.engine = engine
    }

    public var body: some View {
        ZStack {
            ForEach(engine.buds) { bud in
                Text(bud.label)
                    .padding(8)
                    .background(Capsule().stroke(Color.green))
                    .position(x: Double.random(in: 100...600), y: Double.random(in: 100...400))
            }
        }
        .background(
            {
                #if os(macOS)
                Color(nsColor: .underPageBackgroundColor)
                #else
                Color(uiColor: .secondarySystemBackground)
                #endif
            }()
        )
    }
}

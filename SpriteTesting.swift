//
//  SpriteTesting.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/17/25.
//

// This is just for testing the sprite motion/abilities.


import SwiftUI
import SpriteKit

struct SpriteTesting: View {
    var body: some View {
        GeometryReader { Geometry in
            SpriteView(scene: GamePhysics(size: Geometry.size))
        }
    }
}

#Preview {
    SpriteTesting()
}

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
    @EnvironmentObject var gamePhysics: GamePhysics
    var body: some View {
        ZStack {
            GeometryReader { Geometry in
                SpriteView(scene: GamePhysics(size: Geometry.size))
            }
//            GamePad()
        }
    }
}

#Preview {
    SpriteTesting()
        .environmentObject(GamePhysics())
}

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
        ZStack {
            GeometryReader { Geometry in
                SpriteView(scene: GamePhysics(size: Geometry.size))
            }
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.largeTitle)
                        .bold()
                }

            }
        }
    }
}

#Preview {
    SpriteTesting()
}

//
//  OilSpill.swift
//  ClimateChangeGroupApp
//
//  Created by Jacob Caulfield on 4/21/25.
//
import SwiftUI
import SpriteKit

struct OilSpill: View {
    var body: some View {
        GeometryReader { Geometry in
            SpriteView(scene: GamePhysics(size: Geometry.size))
        }
    }
}
 
#Preview {
    OilSpill()
//        .environmentObject(GamePhysics())
}

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
        VStack {
            GeometryReader { Geometry in
                SpriteView(scene: GamePhysics(size: Geometry.size))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
    }
}
 
#Preview {
    OilSpill()
}

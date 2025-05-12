//
//  OilSpill.swift
//  ClimateChangeGroupApp
//
//  Created by Jacob Caulfield on 4/21/25.
//
import SwiftUI
import SpriteKit

struct OilSpill: View {
    @State var showMission = false
    var body: some View {
        NavigationStack {
            VStack {
                GeometryReader { Geometry in
                    SpriteView(scene: OilSpillGameScene(size: Geometry.size))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.blue)
            .onAppear() {
                showMission = true
            }
            .fullScreenCover(isPresented: $showMission) {
                Spacer()
                
                Text("Oh No! A large oil spill has occurred in the Pacific Ocean.")
                    .font(.largeTitle)
                
                Text("Mission: Help the animals affected by the oil spill and remove as much oil as possible.")
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Text("Don't fall off the platforms or you'll restart!")
                    .font(.title2)
                
                Spacer()
                
                Button {
                    showMission = false
                } label: {
                    Text("Go")
                        .font(.title)
                        .buttonStyle(.borderedProminent)
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}
 
#Preview {
    OilSpill()
}

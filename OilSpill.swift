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
    
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader { Geometry in
                    SpriteView(scene: OilSpillGameScene(size: Geometry.size))
                }
                
                //                Button {
                //                    print("button pressed")
                //                    dismiss.callAsFunction()
                //                } label: {
                //                    Image(systemName: "house.fill")
                //                        .font(.largeTitle)
                //                        .position(x: 650, y: -300)
                //                        .foregroundStyle(.white)
                //                        .frame(width: 200, height: 200)
                //                }
                
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
//        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OilSpill()
}

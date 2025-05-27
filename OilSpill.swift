//
//  OilSpill.swift
//  ClimateChangeGroupApp
//
//  Created by Jacob Caulfield on 4/21/25.
//
import SwiftUI
import SpriteKit

struct OilSpillStruct: View {
    @State var showMission = false
    @State var hasEnded = false
    @State var gameScene: SKScene?
    @State var sceneSize: CGSize?
    
    @EnvironmentObject var oilSpill: OilSpillGameScene
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("animals_saved") var animalsSaved = 0
    var body: some View {
        NavigationStack {
            ZStack {
            GeometryReader { Geometry in
//                    if let scene = gameScene {
//                        SpriteView(scene: scene)
//                            .frame(width: Geometry.size.width, height: Geometry.size.height)
//                    } else {
//                        Color.clear
//                    }
                    SpriteView(scene: OilSpillGameScene(size: Geometry.size))
                }
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "house.fill")
                        .position(x: 25, y: 25)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 100)
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.clear)
            .onAppear() {
//                    sceneSize = Geometry.size
                showMission = true
//                    gameScene = OilSpillGameScene(size: Geometry.size)
            }
            .onChange(of: animalsSaved, {
                print("animals saved = \(animalsSaved)")
                if animalsSaved == 2 {
                    hasEnded = true
                    oilSpill.left = false
                    oilSpill.right = false
                    oilSpill.up = false
                }
            })
            .fullScreenCover(isPresented: $showMission) {
                Spacer()
                
                Text("Oh No! A large oil spill has occurred in the Pacific Ocean.")
                    .font(.largeTitle)
                
                Spacer()
                
                Text("Mission: Help the animals affected by the oil spill and remove as much oil as possible.")
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Text("Don't fall off the platforms or you'll restart!")
                    .font(.title)
                
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
            .fullScreenCover(isPresented: $hasEnded) {
                HStack {
                    Button {
                        animalsSaved = 0
                        oilSpill.Player.position.x = 100
                        gameScene = OilSpillGameScene()
                        hasEnded = false
                    } label: {
                        Text("Restart")
                    }
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Home")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OilSpillStruct()
        .environmentObject(OilSpillGameScene())
}

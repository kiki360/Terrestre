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
    
    @EnvironmentObject var oilSpill: OilSpillGameScene
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("animals_saved") var animalsSaved = 0
    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader { Geometry in
                    SpriteView(scene: OilSpillGameScene(size: Geometry.size))
                    
                    Button {
                        print("button pressed")
                        dismiss()
                    } label: {
                        Image(systemName: "house.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.clear)
            .onAppear() {
                showMission = true
            }
            .onChange(of: animalsSaved, {
                print("received: \(animalsSaved)")
                if animalsSaved == 10 {
                    hasEnded = true
                    print(hasEnded)
                }
            })
//            .onChange(of: oilSpill.animalsSaved, {
//                print("onChange received: \(oilSpill.animalsSaved)")
//                if oilSpill.animalsSaved == 10 {
//                    hasEnded = true
//                    print(hasEnded)
//                }
//            })
//            .onReceive(oilSpill.$animalsSaved, perform: { _ in
//                print("onReceive received: \(oilSpill.animalsSaved)")
//                if oilSpill.animalsSaved == 10 {
//                    hasEnded = true
//                    print(hasEnded)
//                }
//            })
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
                        oilSpill.Player.position.x = 100
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

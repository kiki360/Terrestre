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
    @State var sceneSize: CGSize?
    
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
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.clear)
            .onAppear() {
                showMission = true
            }
            .onChange(of: animalsSaved, {
                print("animals saved = \(animalsSaved)")
                if animalsSaved == 10 {
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
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 150, height: 75)
                        .foregroundStyle(.black)
                        .padding()
                        .overlay {
                            Text("Go")
                                .font(.custom("Courier", size: 23))
                                .foregroundStyle(.white)
                        }
                        .shadow(radius: 5, x: 7, y: 7)
                }
                
                Spacer()
            }
            .fullScreenCover(isPresented: $hasEnded) {
                Text("You did it!")
                    .font(.custom("Courier", size: 50))
                    .bold()
                
                HStack {
//                    Button {
//                        gameScene = OilSpillGameScene()
//                        hasEnded = false
//                        oilSpill.reset()
//                    } label: {
//                        RoundedRectangle(cornerRadius: 20)
//                            .frame(width: 150, height: 75)
//                            .foregroundStyle(.black)
//                            .padding()
//                            .overlay {
//                                Text("Restart")
//                                    .font(.custom("Courier", size: 23))
//                                    .foregroundStyle(.white)
//                            }
//                            .shadow(radius: 5, x: 7, y: 7)
//                    }
                    
                    Button {
                        dismiss()
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 150, height: 75)
                            .foregroundStyle(.blue)
                            .padding()
                            .overlay {
                                Text("Home")
                                    .font(.custom("Courier", size: 23))
                                    .foregroundStyle(.white)
                            }
                            .shadow(radius: 5, x: 7, y: 7)
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

/* {
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
 //            .onChange(of: oilSpill.animalsSaved, { oldValue, newValue in
 //                print(oilSpill.animalsSaved)
 //                if oilSpill.animalsSaved == 10 {
 //                    hasEnded = true
 //                    print("hasEnded = \(hasEnded)")
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
 }*/

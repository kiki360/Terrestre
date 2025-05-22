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
    @AppStorage("username") var username: String = "Guest"
    @EnvironmentObject var oilSpill: OilSpillGameScene
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
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
//            .onChange(of: oilSpill.animalsSaved, { oldValue, newValue in
//                print(oilSpill.animalsSaved)
//                if oilSpill.animalsSaved == 10 {
//                    hasEnded = true
//                    print("hasEnded = \(hasEnded)")
//                }
//            })
            .fullScreenCover(isPresented: $showMission) {
                DialogueTestNoResponse(isPresented: $showMission, dialogue:  [1: "\(username)!", 2: "Something went wrong at this Oil Rig and it has started spilling!", 3: "We need your help to get the surrounding wildlife away from it.", 4: "There are ten ducks you need to grab", 5: "Make sure you don't fall off! I don't think those guard rails up there are very safe."])
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OilSpillStruct()
        .environmentObject(OilSpillGameScene())
}

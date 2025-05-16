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
    @AppStorage("username") var username: String = ""
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
                DialogueTestNoResponse(TotalIterations: 2, dialogue:  [1: "Hi, \(username)! We need your help to stop the fracking in our town. To do this, could you please contact our local Town Hall?", 2: "Thanks! We will surely remember this when you return."])
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OilSpillStruct()
        .environmentObject(OilSpillGameScene())
}

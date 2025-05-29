//
//  LevelsMenu.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/17/25.
//

import SwiftUI

struct LevelsMenu: View {
    @Binding var path: [Screen]
    var body: some View {
        NavigationStack{
            Text("Select a Mission")
                .font(.custom("Courier", size: 46))
            HStack {
//                NavigationLink("Question Test", destination: QuestionTest())
//                    .font(.custom("Courier", size: 23))
//                    .foregroundStyle(.white)
//                    .frame(width: 200, height: 75)
//                    .background(.black)
//                    .clipShape(RoundedRectangle(cornerRadius: 25))
//                    .shadow(radius: 5, x: 7, y: 7)
//                    .padding()
                
                NavigationLink("Drag and Drop Game", destination: DragDropView())
                    .font(.custom("Courier", size: 23))
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 75)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .shadow(radius: 5, x: 7, y: 7)
                    .padding()
                
                NavigationLink("Oil Spill") {
                    OilSpillStruct(path: $path)
                }
                .font(.custom("Courier", size: 23))
                .foregroundStyle(.white)
                .frame(width: 200, height: 75)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(radius: 5, x: 7, y: 7)
                .padding()
                
//                NavigationLink("Dialogue Test", destination: DialogueTest())
//                    .font(.custom("Courier", size: 23))
//                    .foregroundStyle(.white)
//                    .frame(width: 200, height: 75)
//                    .background(.black)
//                    .clipShape(RoundedRectangle(cornerRadius: 25))
//                    .shadow(radius: 5, x: 7, y: 7)
//                    .padding()
            }
        }
    }
}

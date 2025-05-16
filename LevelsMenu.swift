//
//  LevelsMenu.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/17/25.
//

import SwiftUI

struct LevelsMenu: View {
    var body: some View {
        NavigationStack{
            Text("Select a Mission")
                .font(.custom("Courier", size: 23))
            NavigationLink("Question Test", destination: QuestionTest())
                .font(.custom("Courier", size: 23))
            NavigationLink("Drag and Drop Game", destination: DragDropView())
                .font(.custom("Courier", size: 23))
            NavigationLink("Sprite Testing -- This will be removed") {
                SpriteTesting()
            }
            .font(.custom("Courier", size: 23))
            NavigationLink("Dialogue Test", destination: DialogueTest())
                .font(.custom("Courier", size: 23))
        }
    }
}

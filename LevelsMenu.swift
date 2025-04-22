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
            Text("Select a Level")
            NavigationLink("Question Test", destination: QuestionTest())
            NavigationLink("Drag and Drop Game", destination: DragDropView())
        }
    }
}

#Preview {
    LevelsMenu()
}

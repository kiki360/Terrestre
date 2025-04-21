//
//  QuestionTest.swift
//  ClimateChangeGroupApp
//
//  Created by Jacob Caulfield on 4/21/25.
//
import SwiftUI

struct Question: Identifiable {
    var id: UUID = UUID()
    var text: String
    var answers: [Bool: String]
}

struct QuestionTest: View {
    let questions: [Question] = [Question(text: "Is Fracking bad for the environment", answers: [true: "Fracking releases a lot of carbon dioxide into the atmosphere, and causes chaos in neighborhoods."])]
    @State var answer: String = ""
    var body: some View {
        List{
            ForEach(questions, id: \.id){ question in
                Section(header: Text(question.text)){
                    TextField("Enter your answer", text: $answer)
                    
                }
            }
        }
    }
}

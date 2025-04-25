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
    @State var questionAnswers: [UUID: String] = [:]
    let questions: [Question] = [Question(text: "Fracking is bad for the environment.", answers: [true: "Correct. Fracking releases a lot of carbon dioxide into the atmosphere, and causes chaos in neighborhoods.", false: "Incorrect. Fracking is bad for the environment."]), Question(text: "The answer for this question is true", answers: [true: "correct", false: "incorrect"]), Question(text: "this question is valid.", answers: [true: "correct", false: "incorrect"])]
    var body: some View {
        List{
            ForEach(questions, id: \Question.id){ question in
                Section(){
                    QuestionView(question: question, questionAnswers: $questionAnswers)
                }
            }
        }
    }
}

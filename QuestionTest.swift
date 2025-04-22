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
    let questions: [Question] = [Question(text: "Fracking is bad for the environment.", answers: [true: "Correct. Fracking releases a lot of carbon dioxide into the atmosphere, and causes chaos in neighborhoods.", false: "Incorrect. Fracking is bad for the environment."]), Question(text: "The answer for this question is true", answers: [true: "correct", false: "incorrect"])]
    @State var answerTemporary: String = ""
    @State var answer: String = ""
    var body: some View {
        List{
            ForEach(questions, id: \Question.id){ question in
                Section(){
//                    questionAnswers
                    Text(question.text)
//                    TextField("Enter your answer as true or false", text: $questionAnswers[question.id])
                        .onSubmit {
                            questionAnswers[question.id] = answerTemporary
                            answerTemporary = ""
                        }
                    if questionAnswers[question.id] == "true" || questionAnswers[question.id] == "True"{
                        Text("\(question.answers[true] ?? "Incorrect")")
                    } else if answer == "false" || answer == "False"{
                        Text("\(question.answers[false] ?? "Incorrect")")
                    }
                }
            }
        }
    }
}

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
    let questions: [Question] = [Question(text: "Fracking is bad for the environment.", answers: [true: "Fracking releases a lot of carbon dioxide into the atmosphere, and causes chaos in neighborhoods.", false: "Incorrect. Fracking is bad for the environment."])]
    @State var answerTemporary: String = ""
    @State var answer: String = ""
    var body: some View {
        List{
            ForEach(questions, id: \.id){ question in
                Section(header: Text(question.text)){
                    TextField("Enter your answer as true or false", text: $answerTemporary)
                        .onSubmit {
                            answer = answerTemporary
                            answerTemporary = ""
                        }
                    if answer == "true" || answer == "True"{
                        Text("\(question.answers[true] ?? "Incorrect")")
                    } else if answer == "false" || answer == "False"{
                        Text("\(question.answers[false] ?? "Incorrect")")
                    }
                }
            }
        }
    }
}

//
//  QuestionView.swift
//  ClimateChangeGroupApp
//
//  Created by Jacob Caulfield on 4/23/25.
//
import SwiftUI

struct QuestionView: View {
    let question: Question
    @State var answerTemporary: String = ""
    @Binding var questionAnswers: [UUID: String]
    var body: some View {
        Text(question.text)
            .font(.custom("Courier", size: 23))
        TextField("Enter your answer as true or false", text: $answerTemporary)
            .onSubmit {
                questionAnswers[question.id] = answerTemporary
                answerTemporary = ""
            }
            .font(.custom("Courier", size: 23))
        if questionAnswers[question.id] == "true" || questionAnswers[question.id] == "True"{
            Text("\(question.answers[true] ?? "Incorrect")")
                .font(.custom("Courier", size: 23))
        } else if questionAnswers[question.id] == "false" || questionAnswers[question.id] == "False"{
            Text("\(question.answers[false] ?? "Incorrect")")
                .font(.custom("Courier", size: 23))
        }
            
    }
}


//
//  DialogueTestNoResponse.swift
//  TerestreDev
//
//  Created by Jacob M. Caulfield on 5/12/25.
//
import SwiftUI

struct DialogueTestNoResponse: View {
    @AppStorage("username") var username = "Guest"
    @State var iterations: Int = 0
    @State var showHistory: Bool = false
    let dialogue: [Int: String]
    var body: some View {
        let TotalIterations: Int = dialogue.count - 1
        Text("\(DialogueNoResponse(Iteration: iterations))")
        Button("Next"){
            iterations += 1
            if iterations > TotalIterations{
                iterations = TotalIterations
            }
        }
        Button("\(ButtonName())"){
            showHistory.toggle()
        }
        if showHistory{
            ForEach(0...iterations, id: \.self){ text in
                Text("\(DialogueNoResponse(Iteration: text))")
            }
        }
    }
    func DialogueNoResponse(Iteration: Int) -> String{
        
        if let iteration = dialogue[Iteration]{
            return iteration
        }
        return ""
    }
    func ButtonName() -> String{
        if showHistory{
            return "Hide Chat History"
        } else {
            return "Show Chat History"
        }
    }
}

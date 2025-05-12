//
//  DialogueTestNoResponse.swift
//  TerestreDev
//
//  Created by Jacob M. Caulfield on 5/12/25.
//
import SwiftUI

struct DialogueTestNoResponse: View {
    @AppStorage("username") var username = "Guest"
    let TotalIterations: Int
    @Binding var iterations: Int
    @Binding var showHistory: Bool
    var body: some View {
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
        let dialogue = [1: "Hi, \(username)! We need your help to stop the fracking in our town. To do this, could you please contact our local Town Hall?", 2: "Thanks! We will surely remember this when you return."]
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

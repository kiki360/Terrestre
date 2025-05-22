//
//  DialogueTestNoResponse.swift
//  TerestreDev
//
//  Created by Jacob M. Caulfield on 5/12/25.
//
import SwiftUI

struct DialogueTestNoResponse: View {
    @Binding var isPresented: Bool
    @AppStorage("username") var username = "Guest"
    @State var iterations: Int = 1
    @State var showHistory: Bool = false
    @State var ShowDoneButton: Bool = false
    let dialogue: [Int: String]
    var body: some View {
        let TotalIterations: Int = dialogue.count - 1
        if TotalIterations >= 0{
            Text("\(DialogueNoResponse(Iteration: iterations))")
            Button("Next"){
                iterations += 1
                if iterations >= TotalIterations{
                    iterations = TotalIterations
                    ShowDoneButton = true
                }
            }
            Button("\(ButtonName())"){
                showHistory.toggle()
            }
            if ShowDoneButton{
                Button("Done"){
                    isPresented = false
                }
            }
            if showHistory{
                ForEach(0...iterations, id: \.self){ text in
                    Text("\(DialogueNoResponse(Iteration: text))")
                }
            }
        } else {
            Text("\(iterations) equals 0 so we can't show anything")
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
//#Preview {
//    DialogueTestNoResponse(dialogue: [:])
//} what happens if zero values are passed

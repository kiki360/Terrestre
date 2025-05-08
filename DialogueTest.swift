//
//  DialogueTest.swift
//  ClimateChangeGroupApp
//
//  Created by Jacob M. Caulfield on 4/30/25.
//

import SwiftUI

struct DialogueTest: View {
    @AppStorage("username") var username = "Guest"
//    @State var Responses: [Int: [String]] = [1: ["Yes, I will help.", "No, I will not help."]]
    let TotalIterations: Int = 2
    @State var iterations: Int = 1
    @State var showHistory: Bool = false
    @State var History: [String] = []
    var body: some View {
        //        Text("\(Dialogue())")
        if showHistory{
            ForEach(0...iterations, id: \.self){ text in
                Text("\(Dialogue(Iteration: text))")
            }
        } else {
            Text("\(Dialogue(Iteration: iterations))")
            Button("Next"){
                iterations += 1
                if iterations > TotalIterations{
                    iterations = TotalIterations
                }
            }
//            ForEach(0...iterations, id: \.self){ text in
//                if let Display = Responses[text]{
//                    Text("\(Display)")
//                } else {
//                    Text("Error")
//                }
//                
//            }
        }
        Button("\(ButtonName())"){
            showHistory.toggle()
        }
    }
    //    func Dialogue() -> String{
    //        let Dialogue: [Int: String] = [1: "Hi, \(username)! We need your help to stop the fracking in our town. To do this, could you please contact our local Town Hall?",2: "Thanks! We will surely remember this when you return."]
    //        switch iterations{
    //        case 1:
    //            return Dialogue[1]!
    //        case 2:
    //            return Dialogue[1]! + "\n" + Dialogue[2]!
    //        default:
    //            return ""
    //        }
    //    }
    func Dialogue(Iteration: Int) -> String{
        let dialogue = [1: "Hi, \(username)! We need your help to stop the fracking in our town. To do this, could you please contact our local Town Hall?",2: "Thanks! We will surely remember this when you return."]
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

//var dialogue: [Int: String] = [1: "Hi, \(username)! We need your help to stop the fracking in our town. To do this, could you please contact our local Town Hall?",2: "Thanks! We will surely remember this when you return."]

//
//  DialogueTest.swift
//  ClimateChangeGroupApp
//
//  Created by Jacob M. Caulfield on 4/30/25.
//

import SwiftUI

struct DialogueTest: View {
    @AppStorage("username") var username = "Guest"
    let TotalIterations: Int = 2
    @State var iterations: Int = 1
    @State var showHistory: Bool = false
    @State var Response: Bool = false
    let ResponseOptions: [Int: [Int: String]] = [1: [1: "Yes, I will help.",2: "No, I will not help."]]
    @State var numberOfButtons: Int = 0
    //Change Response to a let constant later
    //let Response: Bool
    var body: some View {
        Button("Response? \(Response)"){
            Reset()
            Response.toggle()
        }
        if Response {
            if showHistory{
                ForEach(0...iterations, id: \.self){ text in
                    Text("\(DialogueNoResponse(Iteration: text))")
                }
            } else {
                //MARK: Response Version Here
                Text("\(DialogueResponse(purpose: "Text"))")
                ForEach(1...(ResponseOptions[1]?.count ?? 1), id: \.self){ text in
                    Button("\(ResponseOptions[text] ?? [:][text] ?? "Error")") {
                        ButtonClicked(WhichOne: text)
                    }
                }
                }
        } else {
            //        Text("\(Dialogue())")
            if showHistory{
                ForEach(0...iterations, id: \.self){ text in
                    Text("\(DialogueNoResponse(Iteration: text))")
                }
            } else {
                Text("\(DialogueNoResponse(Iteration: iterations))")
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
    func DialogueNoResponse(Iteration: Int) -> String{
        let dialogue = [1: "Hi, \(username)! We need your help to stop the fracking in our town. To do this, could you please contact our local Town Hall?",2: "Thanks! We will surely remember this when you return."]
        if let iteration = dialogue[Iteration]{
            return iteration
        }
        return ""
    }
    func Reset(){
        iterations = 1
        showHistory = false
        numberOfButtons = 0
    }
    func DialogueResponse(purpose: String) -> String{
        let dialogue = [1: "Hi, \(username)! We need your help to stop the fracking in our town. To do this, could you please contact our local Town Hall?",2: "Thanks! We will surely remember this when you return."]
        if purpose == "Button1Name"{
            if let name = ResponseOptions[1]{
                return name[1] ?? ""
            }
        } else if purpose == "Button2Name"{
            if let name = ResponseOptions[1]{
                return name[2] ?? ""
            }
        } else if purpose == "Text"{
            return dialogue[iterations] ?? ""
        }
        return ""
    }
    func NumberOfButtons(){
        if Int(DialogueResponse(purpose: "NumberOfButtons")) ?? 0 == 2{
            
        }
    }
    func ButtonClicked(WhichOne: Int){
        
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
#Preview {
    DialogueTest()
}

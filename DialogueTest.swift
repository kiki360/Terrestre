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
    //Change Response to a let constant later
    //let Response: Bool
    var body: some View {
        Button("Response? \(Response)"){
            Reset()
            Response.toggle()
        }
        if Response {
            //Do not go into this it will crash the app
//            DialogueTestResponse(iterations: $iterations, totalIterations: TotalIterations)
            Text("Our MacBooks aren't updated to support this; I might be wrong, but an error said that the SwiftUI Previewer isn't supported on this version of MacOS.")
            //It should work once Mr. Brown updates the macbooks to the newest MacOS version
        } else {
            DialogueTestNoResponse(TotalIterations: TotalIterations, iterations: $iterations, showHistory: $showHistory)
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
func Reset(){
    iterations = 1
    showHistory = false
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

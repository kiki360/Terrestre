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
    var body: some View {
        Text("\(Dialogue())")
        Button("Next"){
            iterations += 1
            if iterations >= 2{
                iterations = 2
            }
        }
    }
    func Dialogue() -> String{
        let Dialogue: [Int: String] = [1: "Hi, \(username)! We need your help to stop the fracking in our town. To do this, could you please contact our local Town Hall?",2: "Thanks! We will surely remember this when you return."]
        switch iterations{
        case 1:
            return Dialogue[1]!
        case 2:
            return Dialogue[1]! + "\n" + Dialogue[2]!
        default:
            return ""
        }
    }
}
// dialogue: ["Hi, \(username)! We need your help to stop the fracking in our town. To do this, could you please contact our local Town Hall?", "Thanks! We will surely remember this when you return."], totalIteration: 2)


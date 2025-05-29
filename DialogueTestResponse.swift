//
//  DialogueTestResponse.swift
//  Terrestre
//
//  Created by Jacob M. Caulfield on 5/12/25.
//
import SwiftUI
struct DialogueTestResponse: View {
    @AppStorage("username") var username = "Guest"
    let ResponseOptions: [Int: [Int: String]] = [1: [1: "Yes, I will help.",2: "No, I will not help."]]
    @State var numberOfButtons: Int = 0
    @Binding var iterations: Int
    let totalIterations: Int
    
    var body: some View {
        Text("\(DialogueResponse(purpose: "Text"))")
        HStack{
            //MARK: The ForEach is the source of the error I found
            ForEach(1...numberOfButtons, id: \.self){ index in
                Text("\(DialogueResponse(purpose: "Button\(index)Name"))")
            }
        }
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
}


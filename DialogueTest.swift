//
//  DialogueTest.swift
//  ClimateChangeGroupApp
//
//  Created by Jacob M. Caulfield on 4/30/25.
//

import SwiftUI

struct DialogueTest: View {
    @AppStorage("username") var username = "Guest"
    var body: some View {
        NavigationStack{
            VStack{
                
                NavigationLink {
                    Dialogue(characterName: "Test", response: false, dialogue: ["Hi, \(username)! We need your help to stop the fracking in our town. To do this, could you please contact our local Town Hall?", "Thanks! We will surely remember this when you return."], totalIteration: 2)
                } label: {
                    Image(systemName: "exclamationmark.bubble.fill")
                }
            }
        }
    }
}

struct Dialogue: View {
    let characterName: String
    let response: Bool
    let dialogue: [String]
    @State var Iterations: Int = 0
    let totalIteration: Int
    var body: some View {
        Text(characterName)
        List{
            ForEach(dialogue, id: \.self){speech in
                if Iterations >= totalIteration{
                    Text(speech)
                        .onAppear(){
                            Iterations += 1
                        }
                    // This is incomplete, I'm just trying to display the number of texts that the user has finished reading
                }
            }
        }
        Button("Next"){
            Iterations += 1
        }
    }
}

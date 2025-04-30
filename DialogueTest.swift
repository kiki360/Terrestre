//
//  DialogueTest.swift
//  ClimateChangeGroupApp
//
//  Created by Jacob M. Caulfield on 4/30/25.
//

import SwiftUI

struct DialogueTest: View {
    var body: some View {
        NavigationStack{
            VStack{
                
                NavigationLink {
                    Dialogue(characterName: "Test", response: false, dialogue: ["Hi, [CharacterNameHere]! We need your help to stop the fracking in our town. To do this, could you please contact our local Town Hall?", "Thanks! We will surely remember this when you return."], totalIteration: 1)
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
        ScrollView{
            VStack{
                List(){
                    ForEach(dialogue, id:\.self){ index in
                        Text("\(index)")
                    }
                }
            }
        }
        
    }
}

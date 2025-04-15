//
//  HomeScreen.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/15/25.
//

import SwiftUI

struct HomeScreen: View {
    @State var username = "username"
    
    var body: some View {
        HStack {
            Text("Welcome, \(username)")
                .font(.custom("Times new roman", size: 75)) // Change font later
            Button {
                
            } label: {
                Image(systemName: "gear")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.gray)
            }
        }
        
        HStack {
            Button {
                
            } label: {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 200, height: 75)
                    .overlay {
                        Text("Go to levels")
                            .font(.title)
                            .padding()
                            .foregroundStyle(.black)
                    }
            }
            
            Button {
                
            } label: {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 200, height: 75)
                    .overlay {
                        Text("Statistics")
                            .font(.title)
                            .padding()
                            .foregroundStyle(.black)
                    }
            }
        }
    }
}

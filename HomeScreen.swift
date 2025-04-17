//
//  HomeScreen.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/15/25.
//

import SwiftUI

struct HomeScreen: View {
    @AppStorage("username") var username = "Guest"
    @State var popover = false
    var body: some View {
        NavigationStack {
            HStack {
                Text("Welcome, \(username)")
                    .font(.custom("Times new roman", size: 75)) // Change font later
                    .onTapGesture {
                        popover.toggle()
                    }
                    .popover(isPresented: $popover) {
                        Text("You can change your username in settings to the right")
                    }
                //The popover was pretty straight forward; I didn't have to do anything with the developer documentation it was just similar to an alert
                
                NavigationLink {
                    SettingsPage()
                } label: {
                    Image(systemName: "gear")
                        .foregroundStyle(.gray)
                        .font(.title)
                }
                .padding()

            }
            
            HStack {
                NavigationLink {
                    LevelsMenu()
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
                
                NavigationLink {
                    StatisticsPage()
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
}

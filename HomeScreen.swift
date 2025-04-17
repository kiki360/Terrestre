//
//  HomeScreen.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/15/25.
//

import SwiftUI

struct HomeScreen: View {
    @AppStorage("username") var username = "username"
    var body: some View {
        NavigationStack {
            HStack {
                Text("Welcome, \(username)")
                    .font(.custom("Times new roman", size: 75)) // Change font later
                
                NavigationLink {
                    SettingsPage()
                } label: {
                    Image(systemName: "gear")
                        .foregroundStyle(.gray)
                        .font(.title)
                }

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

//
//  HomeScreen.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/15/25.
//

import SwiftUI
struct HomeScreen: View {
    //MARK: Universal font for this app
    //    .font(.custom("Courier", size: 23))
    @AppStorage("username") var username = "Guest"
    @State var popover = false
    var body: some View {
        NavigationStack(){
            HStack {
                Text("Welcome, \(username)")
                    .font(.custom("Courier", size: 70))
                    .onTapGesture {
                        popover.toggle()
                    }
                    .popover(isPresented: $popover) {
                        Text("You can change your username in settings to the right")
                            .padding()
                            .font(.custom("Courier", size: 30))
                    }
                //The popover was pretty straight forward; I didn't have to do anything with the developer documentation it was just similar to an alert
                
                NavigationLink(destination: SettingsPage()){
                    Image(systemName: "gear")
                        .foregroundStyle(.gray)
                        .font(.title)
                }
                .padding()
                
            }
            
            HStack {
                NavigationLink(destination: LevelsMenu()){
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(.black)
                        .frame(width: 200, height: 75)
                        .overlay {
                            Text("Play")
                                .font(.custom("Courier", size: 23))
                                .padding()
                                .foregroundStyle(.white)
                        }
                        .shadow(radius: 5, x: 7, y: 7)
                }
                
                NavigationLink(destination: StatisticsPage()){
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 200, height: 75)
                        .foregroundStyle(.blue)
                        .overlay {
                            Text("Statistics")
                                .font(.custom("Courier", size: 23))
                                .padding()
                                .foregroundStyle(.black)
                        }
                        .shadow(radius: 5, x: 7, y: 7)
                }
            }
        }
    }
}


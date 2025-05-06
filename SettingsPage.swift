//
//  SettingsPage.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/17/25.
//

import SwiftUI

struct SettingsPage: View {
    @AppStorage("username") var username = "Guest"
    @State var TempUsername: String = "Guest"
    @State var toggleControlPlacement = false
    var body: some View {
        VStack {
            TextField("Enter Username", text: $TempUsername)
                .frame(width: 150,alignment: .center)
                .onSubmit {
                    username = TempUsername
                }
                .textFieldStyle( RoundedBorderTextFieldStyle())
            Text("Credits:")
                .font(.largeTitle)
                .bold()
            Text("Calliope Epstein-Pawlak")
            Text("Jacob Micheal Caulfield")
            Text("Brennan Gonzalez")
            Text("Martin Zapryanov")
        }
        Toggle(isOn: $toggleControlPlacement) {
            Text("Control Pad Placement")
        }
        .onChange(of: toggleControlPlacement) { oldValue, newValue in
            if toggleControlPlacement == true {
                let newValue = CGPoint(x: 0, y: 0)
            } else if toggleControlPlacement == false {
                let newValue = CGPoint(x: 1, y: 1)
            }
            
            UserDefaults.standard.set(newValue, forKey: "controlPlacement")
        }
    }
}

#Preview {
    SettingsPage()
}

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
    var body: some View {
        VStack {
            TextField("Enter Username", text: $TempUsername)
                .frame(width: 100,alignment: .center)
                .onSubmit {
                    username = TempUsername
                }
                .textFieldStyle( RoundedBorderTextFieldStyle() )
            Text("Credits:")
                .font(.largeTitle)
                .bold()
        }
    }
}

#Preview {
    SettingsPage()
}

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
    @AppStorage("toggleControlPlacement") var toggleControlPlacement = false
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
                UserDefaults.standard.setCGPoint(CGPoint(x: 1050, y: 140), forKey: "upButtonPlacement")
                
                UserDefaults.standard.setCGPoint(CGPoint(x: 1000, y: 50), forKey: "leftButtonPlacement")
                
                UserDefaults.standard.setCGPoint(CGPoint(x: 1100, y: 50), forKey: "rightButtonPlacement")
                
                UserDefaults.standard.setCGPoint(CGPoint(x: 125, y: 75), forKey: "actionButtonPlacement")
                
            } else if toggleControlPlacement == false {
                UserDefaults.standard.setCGPoint(CGPoint(x: 125, y: 140), forKey: "upButtonPlacement")
                
                UserDefaults.standard.setCGPoint(CGPoint(x: 80, y: 50), forKey: "leftButtonPlacement")
                
                UserDefaults.standard.setCGPoint(CGPoint(x: 175, y: 50), forKey: "rightButtonPlacement")
                
                UserDefaults.standard.setCGPoint(CGPoint(x: 1100, y: 75), forKey: "actionButtonPlacement")
            }
        }
    }
}

extension UserDefaults {
    func setCGPoint(_ value: CGPoint?, forKey key: String) {
        let pointAsData: [String: CGFloat] = ["x": value?.x ?? 0, "y": value?.y ?? 0]
        self.set(pointAsData, forKey: key)
    }
    
    func getCGPoint(forKey key: String) -> CGPoint? {
        guard let pointAsData = self.dictionary(forKey: key) as? [String: CGFloat], let x = pointAsData["x"], let y = pointAsData["y"] else { return nil }
        return CGPoint(x: x, y: y)
    }
}

#Preview {
    SettingsPage()
}

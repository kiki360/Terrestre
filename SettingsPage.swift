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
            Spacer()
            
            Text("Credits:")
                .font(.largeTitle)
                .bold()
            Text("Calliope Epstein-Pawlak")
                .font(.title)
            Text("Jacob Micheal Caulfield")
                .font(.title)
            Text("Brennan Gonzalez")
                .font(.title)
            Text("Martin Zapryanov")
                .font(.title)
            
            Spacer()
            
            HStack {
                Spacer(minLength: 475)
                
                Text("Username:")
                
                Spacer()
                
                TextField("Enter Username", text: $TempUsername)
                    .frame(width: 150,alignment: .center)
                    .onSubmit {
                        username = TempUsername
                    }
                    .textFieldStyle( RoundedBorderTextFieldStyle())
                Spacer(minLength: 475)
            }
        }
        
        
        Toggle(isOn: $toggleControlPlacement) {
            Text(toggleControlPlacement ? "Control Pad on Left" : "Control Pad on Right")
        }
        .padding(EdgeInsets(top: 0, leading: 475, bottom: 0, trailing: 475))
        .onChange(of: toggleControlPlacement) { oldValue, newValue in
            if toggleControlPlacement == true {
                UserDefaults.standard.setCGPoint(CGPoint(x: -550, y: -300), forKey: "upButtonPlacement")
                
                UserDefaults.standard.setCGPoint(CGPoint(x: -595, y: -400), forKey: "leftButtonPlacement")
                
                UserDefaults.standard.setCGPoint(CGPoint(x: -495, y: -400), forKey: "rightButtonPlacement")
                
                UserDefaults.standard.setCGPoint(CGPoint(x: 400, y: -400), forKey: "actionButtonPlacement")
                
            } else if toggleControlPlacement == false {
                UserDefaults.standard.setCGPoint(CGPoint(x: 550, y: -300), forKey: "upButtonPlacement")
                
                UserDefaults.standard.setCGPoint(CGPoint(x: 500, y: -400), forKey: "leftButtonPlacement")
                
                UserDefaults.standard.setCGPoint(CGPoint(x: 600, y: -400), forKey: "rightButtonPlacement")
                
                UserDefaults.standard.setCGPoint(CGPoint(x: -620, y: -400), forKey: "actionButtonPlacement")
            }
        }
        Spacer(minLength: 300)
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

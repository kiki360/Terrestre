import SwiftUI
import SpriteKit

@main
struct MyApp: App {
    @State var lauchScreen = false
    var body: some Scene {
        WindowGroup {
            if lauchScreen == true {
                ContentView()
                    .transition(.slide)
            } else {
                Text("Terrestre")
                    .font(.largeTitle)
                    .bold()
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation() {
                                self.lauchScreen = true
                            }
                        }
                    }
            }
        }
    }
}

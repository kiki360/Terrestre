import SwiftUI
import SpriteKit

@main
struct MyApp: App {
    @StateObject var gamePhysics = GamePhysics()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gamePhysics)
        }
    }
}

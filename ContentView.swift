import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationLink("Fracking", destination: FrackingView())
        }
    }
}

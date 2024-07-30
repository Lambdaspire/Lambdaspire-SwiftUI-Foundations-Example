
import LambdaspireAbstractions
import LambdaspireDependencyResolution
import LambdaspireSwiftUIFoundations
import SwiftUI

@main
struct LambdaspireSwiftUIFoundationsExampleApp: App {
    
    private let container: Container = getAppContainer()
    
    var body: some Scene {
        WindowGroup {
            
            TabView {
                
                AutoExampleScreen()
                    .tabItem {
                        Label("Auto", systemImage: "bolt.fill")
                    }
                
                ManualExampleScreen()
                    .tabItem {
                        Label("Manual", systemImage: "hand.raised.fill")
                    }
            }
            .resolving(from: container)
        }
    }
}


import LambdaspireAbstractions
import LambdaspireDependencyResolution
import LambdaspireSwiftUIFoundations
import SwiftUI

@main
struct LambdaspireSwiftUIFoundationsExampleApp: App {
    
    private let rootScope: DependencyResolutionScope = getAppContainer()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .resolving(from: rootScope)
        }
    }
}

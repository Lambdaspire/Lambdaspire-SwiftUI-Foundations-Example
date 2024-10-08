
import SwiftUI
import LambdaspireAbstractions
import LambdaspireDependencyResolution
import LambdaspireSwiftUIFoundations

@ResolvedScope
struct WelcomeUserNavTitle : ViewModifier {
    
    // @EnvironmentObject might be a more appropriate way to do this
    // as it will follow the SwiftUI view update cycle better.
    // However, purely as an example of how to resolve dependencies inline
    // in a View, here's resolving UserContext and passing it to some
    // other View's / Modifier's @ObservedObject parameter.
    @Resolved private var userContext: UserContext
    
    func body(content: Content) -> some View {
        content.modifier(_WelcomeUserNavTitle(userContext: userContext))
    }
}

struct _WelcomeUserNavTitle : ViewModifier {
    
    @ObservedObject var userContext: UserContext
    
    func body(content: Content) -> some View {
        content.navigationTitle(
            userContext.user.whenLoaded {
                "Welcome, \($0.name)"
            } else: {
                "Welcome"
            })
    }
}

extension View {
    func welcomeUserNavTitle() -> some View {
        modifier(WelcomeUserNavTitle())
    }
}

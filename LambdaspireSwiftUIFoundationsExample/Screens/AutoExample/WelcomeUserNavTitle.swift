
import SwiftUI
import LambdaspireAbstractions
import LambdaspireDependencyResolution
import LambdaspireSwiftUIFoundations

@ResolvedScope
struct WelcomeUserNavTitle : ViewModifier {
    
    @Resolved private var userContext: UserContext
    
    func body(content: Content) -> some View {
        content.modifier(_WelcomeUserNavTitle(userContext: userContext))
    }
}

struct _WelcomeUserNavTitle : ViewModifier {
    
    @ObservedObject var userContext: UserContext
    
    var user: User? {
        switch userContext.user {
        case .loaded(let u): return u
        default: return nil
        }
    }
    
    func body(content: Content) -> some View {
        if let user {
            content.navigationTitle("Welcome, \(user.name)")
        } else {
            content.navigationTitle("Welcome")
        }
    }
}

extension View {
    func welcomeUserNavTitle() -> some View {
        modifier(WelcomeUserNavTitle())
    }
}

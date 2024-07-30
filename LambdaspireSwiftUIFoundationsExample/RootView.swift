
import SwiftUI
import LambdaspireAbstractions
import LambdaspireDependencyResolution
import LambdaspireSwiftUIFoundations

@ViewWithViewModel
struct RootView {
    var content: some View {
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
        .sheet(isPresented: .constant(!vm.authenticated)) {
            AuthScreen()
        }
    }
}

@ViewModel(generateEmpty: true)
final class RootViewViewModel {
    
    @Published private(set) var user: Loadable<User> = .notLoaded
    
    private var userContext: UserContext!
    
    var authenticated: Bool {
        switch user {
        case .loaded(_): return true
        default: return false
        }
    }
    
    init(userContext: UserContext!) {
        self.userContext = userContext
    }
    
    func postInitialise() {
        userContext
            .$user
            .receive(on: DispatchQueue.main)
            .assign(to: &$user)
    }
}

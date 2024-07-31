
import Combine
import LambdaspireAbstractions
import LambdaspireDependencyResolution
import LambdaspireSwiftUIFoundations

@Resolvable
class UserContext : ObservableObject {
    
    @Published private(set) var user: Loadable<User> = .notLoaded
    
    private let auth: AuthService
    
    init(auth: AuthService) {
        self.auth = auth
    }
    
    func signIn() {
        
        user = .loading
        
        Task {
            do {
                user = .loaded(try await auth.signIn())
            } catch {
                user = .error(error)
            }
        }
    }
    
    func signOut() {
        
        user = .loading
        
        Task {
            do {
                try await auth.signOut()
                user = .notLoaded
            } catch {
                user = .error(error)
            }
        }
    }
}

struct User {
    var name: String
}

enum Loadable<T> {
    case notLoaded
    case loading
    case loaded(T)
    case error(Error)
}

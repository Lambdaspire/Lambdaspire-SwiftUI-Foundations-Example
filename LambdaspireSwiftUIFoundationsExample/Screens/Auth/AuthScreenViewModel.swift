
import Combine
import LambdaspireSwiftUIFoundations
import LambdaspireAbstractions
import LambdaspireDependencyResolution

@ViewModel(generateEmpty: true)
final class AuthScreenViewModel {
    
    private var userContext: UserContext!
    
    func signIn() {
        userContext.signIn()
    }
    
}

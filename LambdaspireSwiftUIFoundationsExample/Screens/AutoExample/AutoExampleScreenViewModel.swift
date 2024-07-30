
import SwiftUI
import LambdaspireSwiftUIFoundations
import LambdaspireAbstractions
import LambdaspireDependencyResolution

@ViewModel(generateEmpty: true)
final class AutoExampleScreenViewModel {
    
    @Published private(set) var data: [String] = []
    
    private(set) var dataConext: DataContext!
    private(set) var userContext: UserContext!
    
    func fetch() {
        dataConext.getSomeData()
    }
    
    func postInitialise() {
        dataConext
            .$history
            .receive(on: DispatchQueue.main)
            .assign(to: &$data)
    }
    
    func signOut() {
        userContext.signOut()
    }
}

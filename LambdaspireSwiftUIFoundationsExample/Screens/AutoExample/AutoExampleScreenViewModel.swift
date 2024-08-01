
import SwiftUI
import LambdaspireSwiftUIFoundations
import LambdaspireAbstractions
import LambdaspireDependencyResolution

@ViewModel(generateEmpty: true)
final class AutoExampleScreenViewModel {
    
    @Published private(set) var data: [String] = []
    
    private var dataConext: DataContext!
    private var userContext: UserContext!
    
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

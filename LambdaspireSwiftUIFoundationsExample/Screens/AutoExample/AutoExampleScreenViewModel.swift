
import SwiftUI
import LambdaspireSwiftUIFoundations
import LambdaspireAbstractions
import LambdaspireDependencyResolution

@ViewModel
final class AutoExampleScreenViewModel : ObservableObject {
    
    @Published private(set) var data: [String] = []
    
    private(set) var dataConext: DataContext!
    
    func fetch() {
        dataConext.getSomeData()
    }
    
    func postInitialise() {
        dataConext
            .$history
            .receive(on: DispatchQueue.main)
            .assign(to: &$data)
    }
    
    // TODO: Optionally generate with a macro.
    init() { }
}

// TODO: Optionally generate with a macro.
extension AutoExampleScreenViewModel {
    static let empty: AutoExampleScreenViewModel = .init()
}


import LambdaspireAbstractions
import LambdaspireDependencyResolution
import SwiftUI

@Resolvable
class ManualExampleScreenViewModel : ObservableObject {
    
    @Published private(set) var count: Int = 0
    
    private var api: ApiService
    
    func countAs() {
        Task { @MainActor in
            count = ((try? await api.getData()) ?? "").filter { $0 == "A" }.count
        }
    }
}


import LambdaspireAbstractions
import LambdaspireDependencyResolution
import SwiftUI

@Resolvable
class ManualExampleScreenViewModel : ObservableObject {
    
    @Published private(set) var data: String = ""
    @Published private(set) var count: Int = 0
    
    private var api: ApiService
    
    init(api: ApiService) {
        self.api = api
        
        $data
            .map { d in d.filter { c in c == "A" }.count }
            .assign(to: &$count)
    }
    
    func fetch() {
        Task { @MainActor in
            data = (try? await api.getData()) ?? ""
        }
    }
}

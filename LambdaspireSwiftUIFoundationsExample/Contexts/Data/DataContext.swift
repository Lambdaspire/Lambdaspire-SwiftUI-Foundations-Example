
import Combine
import LambdaspireAbstractions
import LambdaspireDependencyResolution

@Resolvable
class DataContext : ObservableObject {
    
    @Published private(set) var history: [String] = []
    
    private let api: ApiService
    
    init(api: ApiService) {
        self.api = api
    }
    
    func getSomeData() {
        Task {
            guard let newData = try? await api.getData() else { return }
            history.append(newData)
        }
    }
}

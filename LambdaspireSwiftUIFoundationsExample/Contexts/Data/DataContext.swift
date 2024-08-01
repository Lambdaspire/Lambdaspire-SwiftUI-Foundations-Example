
import Foundation
import Combine
import LambdaspireAbstractions
import LambdaspireDependencyResolution

@Resolvable
class DataContext : ObservableObject {
    
    @Published private(set) var history: [String] = []
    
    private let api: ApiService
    
    private let userContext: UserContext
    
    init(api: ApiService, userContext: UserContext) {
        self.api = api
        self.userContext = userContext
        
        clearHistoryWhenUserSignsOut()
    }
    
    func getSomeData() {
        Task {
            guard let newData = try? await api.getData() else { return }
            history.append(newData)
        }
    }
    
    private func clearHistoryWhenUserSignsOut() {
        userContext
            .$user
            .dropFirst()
            .map(\.isLoaded)
            .removeDuplicates()
            .map { _ in [] }
            .receive(on: DispatchQueue.main)
            .assign(to: &$history)
    }
}

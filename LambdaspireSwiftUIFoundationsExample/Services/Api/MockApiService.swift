
import LambdaspireAbstractions
import LambdaspireDependencyResolution

@Resolvable
class MockApiService : ApiService {
    func getData() async throws -> String { "Mock Data" }
}

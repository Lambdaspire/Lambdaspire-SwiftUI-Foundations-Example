
import Foundation
import LambdaspireAbstractions
import LambdaspireDependencyResolution

@Resolvable
class RealApiService : ApiService {
    func getData() async throws -> String {
        try await Task.sleep(nanoseconds: UInt64.random(in: 1000000...10000000))
        return Date().ISO8601Format()
    }
}

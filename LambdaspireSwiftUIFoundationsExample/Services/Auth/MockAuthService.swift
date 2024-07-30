
class MockAuthService : AuthService {
    
    func signIn() async throws -> User {
        .init(name: "Mock User")
    }
    
    func signOut() async throws {
        // Okay.
    }
}

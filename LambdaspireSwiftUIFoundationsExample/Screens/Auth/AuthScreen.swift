
import SwiftUI
import LambdaspireAbstractions
import LambdaspireSwiftUIFoundations

@ViewWithViewModel
struct AuthScreen {
    var content: some View {
        Button {
            vm.signIn()
        } label: {
            Text("Sign In")
        }
    }
}

#Preview {
    AuthScreen()
        .previewContainer { b in
            b.singleton(UserContext.self)
            b.singleton(AuthService.self, assigned(MockAuthService.self))
        }
}

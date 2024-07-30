
import SwiftUI
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

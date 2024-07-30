
import SwiftUI
import LambdaspireAbstractions
import LambdaspireDependencyResolution
import LambdaspireSwiftUIFoundations

@ViewWithViewModel
struct AutoExampleScreen {
    
    @State var showModal: Bool = false
    
    var content: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(vm.data, id: \.self) { d in
                        Text(d)
                    }
                }
            }
            .welcomeUserNavTitle()
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        vm.fetch()
                    } label: {
                        Text("Fetch")
                    }
                }
                
                ToolbarItem(placement: .secondaryAction) {
                    Button {
                        showModal = true
                    } label: {
                        Text("Modal Me")
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        vm.signOut()
                    } label: {
                        Text("Sign Out")
                    }
                }
            }
            .sheet(isPresented: $showModal) {
                AutoExampleScreen()
            }
        }
    }
}

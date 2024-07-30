
import SwiftUI
import LambdaspireAbstractions
import LambdaspireDependencyResolution
import LambdaspireSwiftUIFoundations

@ViewWithViewModel
struct AutoExampleScreen {
    var content: some View {
        NavigationStack {
            List {
                ForEach(vm.data, id: \.self) { d in
                    Text(d)
                }
            }
            .navigationTitle("Data")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        vm.fetch()
                    } label: {
                        Text("Fetch")
                    }
                }
            }
        }
    }
}


import SwiftUI
import LambdaspireAbstractions
import LambdaspireDependencyResolution

struct ManualExampleScreen : View {
    
    @State private var vm: ManualExampleScreenViewModel?
    
    @Environment(\.scope) private var scope
    
    var body: some View {
        if let vm {
            ManualExampleContent(vm: vm)
        } else {
            ProgressView()
                .task {
                    vm = scope.resolve() as ManualExampleScreenViewModel
                }
        }
    }
}

struct ManualExampleContent : View {
    
    @ObservedObject var vm: ManualExampleScreenViewModel
    
    var body: some View {
        Button {
            vm.fetch()
        } label: {
            VStack {
                Text(vm.data)
                Text("There are \(vm.count) A's in the data. WOW!")
            }
        }
    }
}

#Preview {
    ManualExampleScreen()
        .withStaticPreviewContainer()
}

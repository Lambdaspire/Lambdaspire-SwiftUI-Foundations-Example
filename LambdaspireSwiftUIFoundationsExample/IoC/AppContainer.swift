
import LambdaspireAbstractions
import LambdaspireDependencyResolution

func getAppContainer() -> Container {
    
    let b: ContainerBuilder = .init()
    
    b.singleton(DataContext.self)
    b.transient(Optional<DataContext>.self, assigned(DataContext.self)) // Support !
    
    b.transient(ManualExampleScreenViewModel.self)
    
    b.transient(ApiService.self, assigned(RealApiService.self))
    b.transient(Optional<ApiService>.self, assigned(ApiService.self)) // Support !
    
    return b.build()
}

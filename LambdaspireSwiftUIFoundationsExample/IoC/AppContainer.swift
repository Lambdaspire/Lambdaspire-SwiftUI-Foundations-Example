
import LambdaspireAbstractions
import LambdaspireDependencyResolution

func getAppContainer() -> Container {
    
    let b: ContainerBuilder = .init()
    
    b.singleton(DataContext.self)
    b.singleton(UserContext.self)
    
    b.transient(ManualExampleScreenViewModel.self)
    b.transient(ApiService.self, assigned(RealApiService.self))
    b.singleton(AuthService.self, assigned(RealAuthService.self))
    
    return b.build()
}

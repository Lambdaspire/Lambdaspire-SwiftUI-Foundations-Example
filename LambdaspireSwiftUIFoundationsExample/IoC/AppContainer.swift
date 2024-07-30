
import LambdaspireAbstractions
import LambdaspireDependencyResolution

func getAppContainer() -> Container {
    
    let b: ContainerBuilder = .init()
    
    b.transient(ManualExampleScreenViewModel.self)
    
    b.singleton(DataContext.self)
    b.transient(Optional<DataContext>.self, assigned(DataContext.self)) // Support !
    
    b.singleton(UserContext.self)
    b.transient(Optional<UserContext>.self, assigned(UserContext.self)) // Support !
    
    b.transient(ApiService.self, assigned(RealApiService.self))
    b.transient(Optional<ApiService>.self, assigned(ApiService.self)) // Support !
    
    b.singleton(AuthService.self, assigned(RealAuthService.self))
    b.transient(Optional<AuthService>.self, assigned(AuthService.self)) // Support !
    
    // TODO: Anything reasonable to do about "Support !" to reduce noise?
    
    return b.build()
}

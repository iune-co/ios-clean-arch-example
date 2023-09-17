import infrastructure_dependencyContainer
import domain_recipe

public struct FeatureRecipeServiceRegister: ServiceRegister {
    public init() {
        
    }
    
    public func register(on container: DependencyContainer) {
        let registerRecipesPresenter: () -> RecipesPresenter = {
            let getRecipesUseCase: GetRecipesUseCase = container.resolve()
            return RecipesPresenterImplementation(getRecipesUseCase: getRecipesUseCase)
        }
        container.register(registerRecipesPresenter(), for: RecipesPresenter.self)
        
        let registerRecipesViewModel: () -> RecipesViewModelImplementation = {
            let presenter: RecipesPresenter = container.resolve()
            return RecipesViewModelImplementation(presenter: presenter)
        }
        container.register(registerRecipesViewModel(), for: RecipesViewModelImplementation.self)
    }
}

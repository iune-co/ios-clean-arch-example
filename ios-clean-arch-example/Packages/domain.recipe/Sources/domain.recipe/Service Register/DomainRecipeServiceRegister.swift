import infrastructure_dependencyContainer

public final class DomainRecipeServiceRegister: ServiceRegister {
    public init() {}
    
    public func register(on container: DependencyContainer) {
        let registerGetRecipesUseCase: () -> GetRecipesUseCase = {
            let recipesRepository: RecipesRepository = container.resolve()
            let getRecipesUseCaseImplementation = GetRecipesUseCaseImplementation(repository: recipesRepository)
            return getRecipesUseCaseImplementation
        }
        container.register(
            registerGetRecipesUseCase(),
            for: GetRecipesUseCase.self
        )
    }
}

import Foundation
import domain_recipe
import infrastructure_dependencyContainer
import infrastructure_network

public struct DataRecipeServiceRegister: ServiceRegister {
    public init() {
        
    }
    
    public func register(on container: DependencyContainer) {
        let registerRecipeRepository: () -> RecipesRepository = {
            let networkProvider: NetworkProvider = container.resolve()
            return RecipesRepositoryImplementation(networkProvider: networkProvider)
        }
        container.register(registerRecipeRepository(), for: RecipesRepository.self)
        
        let getRecipesUseCase: () -> GetRecipesUseCase = {
            let recipesRepository: RecipesRepository = container.resolve()
            return GetRecipesUseCaseImplementation(repository: recipesRepository)
        }
        container.register(getRecipesUseCase(), for: GetRecipesUseCase.self)
    }
}

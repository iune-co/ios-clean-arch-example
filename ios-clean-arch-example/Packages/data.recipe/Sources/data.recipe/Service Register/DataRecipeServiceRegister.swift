import Foundation
import infrastructure_dependencyContainer
import infrastructure_network
import domain_recipe

public struct DataRecipeServiceRegister: ServiceRegister {
    public init() {}
    
    public func register(on container: DependencyContainer) {
        let registerRecipeRepository: () -> RecipesRepository = {
            let networkProvider: NetworkProvider = container.resolve()
            let mapper: RecipeMapper = RecipeMapperImplementation()
            return RecipesRepositoryImplementation(networkProvider: networkProvider, mapper: mapper)
        }
        container.register(
            registerRecipeRepository(),
            for: RecipesRepository.self
        )
    }
}

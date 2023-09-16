import Foundation
import domain_recipe
import infrastructure_dependencyContainer
import infrastructure_network

public struct DataRecipeServiceRegister {
    public static func register(on container: DependencyContainer) {
        let registerRecipeRepository: () -> RecipesRepository = {
            let networkProvider: NetworkProvider = NetworkProviderFactory.createProvider()
            let recipesService = RecipesService(networkProvider: networkProvider)
            return RecipesRepositoryImplementation(recipesService: recipesService)
        }
        container.register(registerRecipeRepository(), for: RecipesRepository.self)
    }
}

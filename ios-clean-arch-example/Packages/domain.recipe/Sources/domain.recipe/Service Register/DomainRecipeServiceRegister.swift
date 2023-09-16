import Foundation
import infrastructure_dependencyContainer

public struct DomainRecipeServiceRegister {
    public static func register(on container: DependencyContainer) {
        let registerGetRecipesUseCase: () -> GetRecipesUseCase = {
            let recipesRepository: RecipesRepository = container.resolve()
            return GetRecipesUseCase(repository: recipesRepository)
        }
        container.register(registerGetRecipesUseCase(), for: GetRecipesUseCase.self)
    }
}

import infrastructure_dependencyContainer
import domain_recipe

public struct FeatureRecipeServiceRegister {
    public static func register(on container: DependencyContainer) {
        let registerViewModel: () -> RecipesViewModel = {
            let getRecipesUseCase: GetRecipesUseCase = container.resolve()
            return RecipesViewModel(getRecipesUseCase: getRecipesUseCase)
        }
        container.register(registerViewModel(), for: RecipesViewModel.self)
    }
}

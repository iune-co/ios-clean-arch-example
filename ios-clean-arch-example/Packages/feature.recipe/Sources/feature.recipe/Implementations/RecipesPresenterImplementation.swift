import domain_recipe

internal final class RecipesPresenterImplementation: RecipesPresenter {
    private let getRecipesUseCase: GetRecipesUseCase
    
    public init(getRecipesUseCase: GetRecipesUseCase) {
        self.getRecipesUseCase = getRecipesUseCase
    }
    
    public func getRecipes(page: Int) async throws -> [RecipeDisplayModel] {
        let recipes = try await getRecipesUseCase(page: page)
        
        return try await withThrowingTaskGroup(
            of: RecipeDisplayModel.self,
            body: { [weak self] group in
                guard let self = self else { return [] }
                
                for recipe in recipes {
                    group.addTask {
                        self.convertToDisplayModel(recipe)
                    }
                }
                
                var displayModels: [RecipeDisplayModel] = []
                for try await displayModel in group {
                    displayModels.append(displayModel)
                }
                
                return displayModels
            }
        )
    }
    
    public func convertToDisplayModel(_ recipe: Recipe) -> RecipeDisplayModel {
        RecipeDisplayModel(
            id: recipe.id,
            name: recipe.name,
            headline: recipe.headline,
            image: recipe.image,
            preparationMinutes: recipe.preparationMinutes
        )
    }
}

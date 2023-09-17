import domain_recipe

internal final class RecipesPresenterImplementation: RecipesPresenter {
    private let getRecipesUseCase: GetRecipesUseCase
    
    public init(getRecipesUseCase: GetRecipesUseCase) {
        self.getRecipesUseCase = getRecipesUseCase
    }
    
    public func getRecipes(page: Int) async throws -> [Recipe] {
        try await self.getRecipesUseCase(page: page)
    }
}

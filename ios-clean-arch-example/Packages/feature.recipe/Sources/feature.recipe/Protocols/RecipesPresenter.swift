import domain_recipe

public protocol RecipesPresenter {
    init(getRecipesUseCase: GetRecipesUseCase)
    func getRecipes(page: Int) async throws -> [Recipe]
}

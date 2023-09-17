import infrastructure_feature

public protocol RecipesViewModel: ViewModel {
    var recipes: [RecipeDisplayModel] { get }
    var error: Error? { get }
    init(presenter: RecipesPresenter)
    func getRecipes(page: Int) async
}

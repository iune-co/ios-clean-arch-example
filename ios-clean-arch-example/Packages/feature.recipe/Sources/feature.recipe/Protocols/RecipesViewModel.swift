import infrastructure_feature
import domain_recipe

public protocol RecipesViewModel: ViewModel {
    var recipes: [Recipe] { get }
    var error: Error? { get }
    init(presenter: RecipesPresenter)
    func getRecipes(page: Int) async
}

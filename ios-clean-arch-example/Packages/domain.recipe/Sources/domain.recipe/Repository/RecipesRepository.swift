import Foundation

public protocol RecipesRepository {
    func getRecipes(page: Int) async throws -> [Recipe]
}

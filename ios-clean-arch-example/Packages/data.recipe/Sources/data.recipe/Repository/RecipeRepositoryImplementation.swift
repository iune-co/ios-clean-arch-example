import Foundation
import domain_recipe

final class RecipesRepositoryImplementation: RecipesRepository {
    private let recipesService: RecipesService
    
    init(recipesService: RecipesService) {
        self.recipesService = recipesService
    }
    
    func getRecipes(page: Int) async throws -> [Recipe] {
        try await self.recipesService.getRecipes(page: page)
    }
}

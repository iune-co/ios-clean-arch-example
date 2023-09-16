import domain_recipe

final class GetRecipesUseCaseImplementation: GetRecipesUseCase {
    private let repository: RecipesRepository
    
    init(repository: RecipesRepository) {
        self.repository = repository
    }
    
    func callAsFunction(page: Int) async throws -> [Recipe] {
        try await repository.getRecipes(page: page)
    }
}

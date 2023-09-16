import Foundation

public final class GetRecipesUseCase {
    private let repository: RecipesRepository
    
    public init(repository: RecipesRepository) {
        self.repository = repository
    }
    
    public func callAsFunction(page: Int) async throws -> [Recipe] {
        try await repository.getRecipes(page: page)
    }
}

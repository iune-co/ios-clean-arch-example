import Foundation

public protocol GetRecipesUseCase {
    init(repository: RecipesRepository)
    func callAsFunction(page: Int) async throws -> [Recipe]
}

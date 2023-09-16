import Foundation
import domain_recipe
import infrastructure_network

final class RecipesRepositoryImplementation: RecipesRepository {
    private let networkProvider: NetworkProvider
    
    init(networkProvider: NetworkProvider) {
        self.networkProvider = networkProvider
    }
    
    func getRecipes(page: Int) async throws -> [Recipe] {
        try await self.networkProvider.request(RecipesAPI.getRecipes(page: page))
    }
}

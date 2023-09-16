import Foundation
import infrastructure_network
import domain_recipe

final class RecipesService {
    private let networkProvider: NetworkProvider
    
    init(networkProvider: NetworkProvider) {
        self.networkProvider = networkProvider
    }
    
    func getRecipes(page: Int) async throws -> [Recipe] {
        try await self.networkProvider.request(RecipesAPI.getRecipes(page: page))
    }
}

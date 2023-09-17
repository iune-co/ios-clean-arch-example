import Foundation
import domain_recipe
import infrastructure_network

final class RecipesRepositoryImplementation: RecipesRepository {
    private let networkProvider: NetworkProvider
    private let mapper: RecipeMapper
    
    init(networkProvider: NetworkProvider, mapper: RecipeMapper) {
        self.networkProvider = networkProvider
        self.mapper = mapper
    }
    
    func getRecipes(page: Int) async throws -> [Recipe] {
        let apiModels: [RecipeAPIModel] = try await self.networkProvider.request(RecipesAPI.getRecipes(page: page))
        return try await mapper.convertToRecipes(apiModels)
    }
}

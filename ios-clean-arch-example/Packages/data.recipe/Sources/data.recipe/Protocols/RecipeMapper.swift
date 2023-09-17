import domain_recipe

protocol RecipeMapper {
    func convertToRecipes(_ models: [RecipeAPIModel]) async throws -> [Recipe]
}

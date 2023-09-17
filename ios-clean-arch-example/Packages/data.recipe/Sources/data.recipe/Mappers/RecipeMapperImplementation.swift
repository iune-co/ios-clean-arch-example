import domain_recipe

final class RecipeMapperImplementation: RecipeMapper {
    func convertToRecipes(_ models: [RecipeAPIModel]) async throws -> [Recipe] {
        try await withThrowingTaskGroup(
            of: Recipe.self,
            body: { group in
                for model in models {
                    group.addTask {
                        Recipe(
                            id: model.id,
                            name: model.name,
                            headline: model.headline,
                            image: model.image,
                            preparationMinutes: model.preparationMinutes
                        )
                    }
                }
                
                var recipes: [Recipe] = []
                for try await recipe in group {
                    recipes.append(recipe)
                }
                
                return recipes
            }
        )
    }
}

import domain_recipe

final class RecipeMapperImplementation: RecipeMapper {
    func convertToRecipe(_ model: RecipeAPIModel) -> Recipe {
        Recipe(
            id: model.id,
            name: model.name,
            headline: model.headline,
            image: model.image,
            preparationMinutes: model.preparationMinutes
        )
    }
}

import domain_recipe

protocol RecipeMapper {
    func convertToRecipe(_: RecipeAPIModel) -> Recipe
}

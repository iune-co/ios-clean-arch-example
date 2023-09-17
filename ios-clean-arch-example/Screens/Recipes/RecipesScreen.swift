import SwiftUI
import feature_recipe
import infrastructure_dependencyContainer

struct RecipesScreen: View {
    @StateObject private var viewModel: RecipesViewModelImplementation
    
    init(resolver: Resolver) {
        self._viewModel = StateObject(wrappedValue: resolver.resolve())
    }
  
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(
                    alignment: .leading,
                    spacing: 20
                ) {
                    if let error = viewModel.error {
                        Text("Error: \(error.localizedDescription)")
                            .foregroundColor(.red)
                    } else {
                        ForEach(viewModel.recipes) {
                            RecipesCard(recipe: $0)
                        }
                    }
                }
                .padding(EdgeInsets(horizontal: 12))
            }
            .navigationTitle("Recipes")
        }
    }
}

private struct RecipesCard: View {
    private let recipe: RecipeDisplayModel
    
    init(recipe: RecipeDisplayModel) {
        self.recipe = recipe
    }
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 8
        ) {
            Text("ID: \(recipe.id)")
            Text("Name: \(recipe.name)")
            Text("Headline: \(recipe.headline)")
            Text("Preparation Minutes: \(recipe.preparationMinutes) minutes")
        }
        .padding(10)
        .border(Color.black)
        .frame(maxWidth: .infinity)
    }
}

import infrastructure_dependencyManager
struct RecipesScreen_Previews: PreviewProvider {
    static let resolver = DependencyManager.toPreviewInstance()
    static var previews: some View {
        RecipesScreen(resolver: resolver)
    }
}

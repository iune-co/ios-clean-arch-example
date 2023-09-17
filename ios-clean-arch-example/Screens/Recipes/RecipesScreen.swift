import SwiftUI
import feature_recipe
import infrastructure_dependencyContainer

struct RecipesScreen: View {
    @StateObject private var viewModel: RecipesViewModelImplementation
    
    init(resolver: Resolver) {
        self._viewModel = StateObject(wrappedValue: resolver.resolve())
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                        .foregroundColor(.red)
                } else {
                    ForEach(viewModel.recipes) { recipe in
                        VStack {
                            Text("ID: \(recipe.id)")
                            Text("Name: \(recipe.name)")
                            Text("Headline: \(recipe.headline)")
                            Text("Preparation Minutes: \(recipe.preparationMinutes) minutes")
                        }
                        
                        Divider()
                    }
                }
            }
        }
    }
}

import domain_recipe
private struct RecipesCard: View {
    private let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(recipe.id)")
            Text("Name: \(recipe.name)")
            Text("Headline: \(recipe.headline)")
            Text("Preparation Minutes: \(recipe.preparationMinutes) minutes")
        }
        .border(Color.black)
        .padding(10)
    }
}

import infrastructure_dependencyManager
struct RecipesScreen_Previews: PreviewProvider {
    static let resolver: Resolver = DependencyManager.toPreviewInstance()
    static var previews: some View {
        RecipesScreen(resolver: resolver.resolve())
    }
}

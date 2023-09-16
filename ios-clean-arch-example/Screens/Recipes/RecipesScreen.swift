import SwiftUI
import feature_recipe
import infrastructure_dependencyContainer

struct RecipesScreen: View {
    @StateObject private var viewModel: RecipesViewModel
    
    init(resolver: Resolver) {
        self._viewModel = StateObject(wrappedValue: resolver.resolve())
    }
    
    var body: some View {
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
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getRecipes(page: 1)
            }
        }
    }
}

//struct RecipesScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipesScreen(resolver: <#T##Resolver#>)
//    }
//}

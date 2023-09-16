import SwiftUI
import domain_recipe

public final class RecipesViewModel: ObservableObject {
    private let getRecipesUseCase: GetRecipesUseCase
    @Published public var recipes: [Recipe] = []
    @Published public var error: Error?
    
    public init(getRecipesUseCase: GetRecipesUseCase) {
        self.getRecipesUseCase = getRecipesUseCase
    }
    
    public func getRecipes(page: Int) async {
        do {
            let recipes = try await getRecipesUseCase(page: page)
            
            await updateUI {
                self.recipes = recipes
            }
        } catch {
            await updateUI {
                self.error = error
            }
        }
    }
    
    private func updateUI(block: @escaping () -> Void) async {
        Task { @MainActor in
            block()
        }
    }
}

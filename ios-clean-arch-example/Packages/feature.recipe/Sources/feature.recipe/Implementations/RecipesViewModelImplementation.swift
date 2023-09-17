import SwiftUI
import domain_recipe

public final class RecipesViewModelImplementation: RecipesViewModel, ObservableObject {
    private let presenter: RecipesPresenter
    @Published public private(set) var recipes: [Recipe]
    @Published public private(set) var error: Error?
    
    public init(presenter: RecipesPresenter) {
        self.presenter = presenter
        self._recipes = Published(initialValue: [])
        self._error = Published(initialValue: nil)
        
        Task {
            await getRecipes(page: 0)
        }
    }
  
    public func getRecipes(page: Int) async {
        do {
            let recipes = try await presenter.getRecipes(page: page)
            await updateUI { self.recipes = recipes}
        } catch {
            await updateUI { self.error = error }
        }
    }
}

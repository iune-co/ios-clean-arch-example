import SwiftUI
import Combine
import domain_recipe

public protocol RecipesViewModel: ViewModel {
    var recipes: [Recipe] { get }
    var error: Error? { get }
    init(presenter: RecipesPresenter)
    func getRecipes(page: Int) async
}

public protocol ViewModel {
    @MainActor
    func updateUI(block: @escaping () -> Void) async
}

extension ViewModel {
    @MainActor
    public func updateUI(block: @escaping () -> Void) async {
        block()
    }
}

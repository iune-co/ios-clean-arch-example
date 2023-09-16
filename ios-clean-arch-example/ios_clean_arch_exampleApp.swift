import SwiftUI
import infrastructure_dependencyManager

@main
struct ios_clean_arch_exampleApp: App {
    private let dependencyManager = DependencyManager()
    
    var body: some Scene {
        WindowGroup {
            RecipesScreen(resolver: dependencyManager)
        }
    }
}

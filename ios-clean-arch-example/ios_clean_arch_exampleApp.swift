import SwiftUI
import domain_recipe
import data_recipe
import feature_recipe
import infrastructure_network
import infrastructure_dependencyManager

@main
struct ios_clean_arch_exampleApp: App {
    private let dependencyManager = DependencyManager(
        storage: DependencyStorageImplementation(),
        serviceRegisters: [
            DomainRecipeServiceRegister(),
            DataRecipeServiceRegister(),
            FeatureRecipeServiceRegister(),
            NetworkServiceRegister()
        ]
    )
    
    var body: some Scene {
        WindowGroup {
            RecipesScreen(resolver: dependencyManager)
        }
    }
}

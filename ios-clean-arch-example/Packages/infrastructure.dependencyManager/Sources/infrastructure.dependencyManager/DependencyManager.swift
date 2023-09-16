import domain_recipe
import data_recipe
import feature_recipe
import infrastructure_dependencyContainer

public class DependencyManager: DependencyContainer {
    private var store: [String: () -> Any] = [:]

    public init() {
        DomainRecipeServiceRegister.register(on: self)
        DataRecipeServiceRegister.register(on: self)
        FeatureRecipeServiceRegister.register(on: self)
    }
    
    public func register<T>(_ dependency: @escaping @autoclosure () -> T, for type: T.Type) {
        let id = String(describing: T.self)
        store[id] = dependency
    }
    
    public func resolve<T>() -> T {
        let id = String(describing: T.self)

        guard let initializer = store[id] else {
            fatalError("Could not resolve for \(T.self)")
        }
        
        guard let value = initializer() as? T else {
            // Never happens due to the register function
            // being generic - this is needed only because
            // `store.value` is `Any`
            fatalError("...")
        }

        return value
    }
}

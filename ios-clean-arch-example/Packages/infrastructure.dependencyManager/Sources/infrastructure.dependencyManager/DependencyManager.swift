import infrastructure_dependencyContainer

// sourced: https://medium.com/streamotion-tech-blog/magic-dependency-injection-in-swift-70476c7743ec
public class DependencyManager: DependencyContainer {
    private let storage: DependencyStorage

    public init(storage: DependencyStorage, serviceRegisters: [ServiceRegister]) {
        self.storage = storage
        serviceRegisters.forEach { $0.register(on: self) }
    }
    
    
    public func register<T>(_ dependency: @escaping @autoclosure () -> T, for type: T.Type) {
        storage.store(serviceName: String(describing: T.self), instance: dependency)
    }
    
    public func resolve<T>() -> T {
        let serviceName = String(describing: T.self)
        
        guard let initializer = storage.retrieve(serviceName: serviceName) else {
            fatalError(#function + " could not resolve \(T.self)")
        }
        
        guard let instance = initializer() as? T else {
            fatalError(#function + " could not resolve \(T.self)")
        }
        
        return instance
    }
}

import domain_recipe
import data_recipe
import feature_recipe
import infrastructure_network
extension DependencyManager {
    public static func toPreviewInstance() -> Resolver {
        DependencyManager(
            storage: DependencyStorageImplementation(),
            serviceRegisters: [
                DataRecipeServiceRegister(),
                FeatureRecipeServiceRegister(),
                NetworkServiceRegister()
            ]
        )
    }
}

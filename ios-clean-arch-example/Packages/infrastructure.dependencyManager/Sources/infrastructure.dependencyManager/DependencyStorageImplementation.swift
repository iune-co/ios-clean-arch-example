import infrastructure_dependencyContainer

public final class DependencyStorageImplementation: DependencyStorage {
    private var storage: [String: () -> Any]
    
    public init() {
        self.storage = [:]
    }
    
    public func store(serviceName: String, instance: @escaping () -> Any) {
        storage[serviceName] = instance
    }
    
    public func retrieve(serviceName: String) -> (() -> Any)? {
        storage[serviceName]
    }
}

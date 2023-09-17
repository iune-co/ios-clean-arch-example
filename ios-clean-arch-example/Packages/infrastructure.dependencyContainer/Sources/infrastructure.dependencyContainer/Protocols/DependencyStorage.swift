public protocol DependencyStorage {
    func store(serviceName: String, instance: @escaping () -> Any)
    func retrieve(serviceName: String) -> (() -> Any)?
}

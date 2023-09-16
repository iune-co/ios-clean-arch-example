public protocol Registrar {
    func register<T>(_ dependency: @escaping @autoclosure () -> T, for type: T.Type)
}

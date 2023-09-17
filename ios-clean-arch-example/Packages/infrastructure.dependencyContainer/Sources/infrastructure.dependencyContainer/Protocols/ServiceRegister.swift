public protocol ServiceRegister {
    init()
    func register(on: DependencyContainer)
}

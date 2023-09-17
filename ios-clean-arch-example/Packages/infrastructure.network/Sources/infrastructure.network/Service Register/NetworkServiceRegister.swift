import Foundation
import infrastructure_dependencyContainer

public struct NetworkServiceRegister: ServiceRegister {
    public init() {
        
    }
    public func register(on container: DependencyContainer) {
        let registerNetworkProvider: () -> NetworkProvider = {
            return NetworkProviderImplementation(
                logger: NetworkLoggerImplementation(),
                networkSession: URLSession.shared
            )
        }
        container.register(registerNetworkProvider(), for: NetworkProvider.self)
    }
}

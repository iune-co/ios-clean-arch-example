import Foundation

public struct NetworkProviderFactory {
    public static func createProvider() -> NetworkProvider {
        NetworkProviderImplementation(
            logger: NetworkLoggerImplementation(),
            networkSession: URLSession.shared
        )
    }
}


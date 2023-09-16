import Foundation

public protocol NetworkSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

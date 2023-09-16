public protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String?]? { get }
    var body: RequestBody { get }
}

public extension Endpoint {
    var method: HTTPMethod { .get }
    var headers: [String: String?]? { nil }
    var body: RequestBody { .plain }
}

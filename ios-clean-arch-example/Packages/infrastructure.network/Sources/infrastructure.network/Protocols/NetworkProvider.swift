import Foundation

public protocol NetworkProvider
{
    init(logger: NetworkLogger?, networkSession: NetworkSession)
    func request<ResponseType: Decodable, EndpointType: Endpoint>(_ endpoint: EndpointType) async throws -> ResponseType
}

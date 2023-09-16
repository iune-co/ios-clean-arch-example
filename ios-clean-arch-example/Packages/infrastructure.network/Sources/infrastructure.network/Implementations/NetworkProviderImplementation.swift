import Foundation

public final class NetworkProviderImplementation: NetworkProvider {
    private let logger: NetworkLogger?
    private let networkSession: NetworkSession
    
    public init(logger: NetworkLogger?, networkSession: NetworkSession) {
        self.logger = logger
        self.networkSession = networkSession
    }
    
    public func request<ResponseType: Decodable, EndpointType: Endpoint>(_ endpoint: EndpointType) async throws -> ResponseType {
        do {
            let urlRequest = try prepareUrlRequest(for: endpoint)
            logger?.log(request: urlRequest)
            let (data, httpResponse) = try await networkSession.data(for: urlRequest)
            logger?.log(response: httpResponse, data: data)
            let decoder = JSONDecoder()
            return try decoder.decode(ResponseType.self, from: data)
        } catch {
            logger?.log(error: error)
            throw error
        }
    }
    
    private func prepareUrlRequest<EndpointType: Endpoint>(for endpoint: EndpointType) throws -> URLRequest {
        let urlString = endpoint.path

        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidUrl
        }

        var urlRequest = URLRequest(url: url)

        endpoint.headers?.forEach { header in
            guard let value = header.value else { return }
            urlRequest.addValue(value, forHTTPHeaderField: header.key)
        }

        urlRequest.httpMethod = endpoint.method.rawValue

        switch endpoint.body {
        case .plain:
            break
        case let .encodable(parameters):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            urlRequest.addValue("application/json", forHTTPHeaderField: HTTPHeaderName.contentType.rawValue)
        case let .queryParameter(parameters):
            guard var urlComponents = URLComponents(string: urlString) else {
                return urlRequest
            }

            let queryItem = parameters.compactMap { param -> URLQueryItem? in
                guard let value = param.value else { return nil }
                return URLQueryItem(name: param.key, value: String(describing: value))
            }
            urlComponents.queryItems = queryItem
            urlRequest.url = urlComponents.url
        }

        return urlRequest
    }
}

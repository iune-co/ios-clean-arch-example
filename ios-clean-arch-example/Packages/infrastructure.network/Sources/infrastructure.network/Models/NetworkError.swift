public enum NetworkError: Error {
    case noData
    case unauthorized
    case badRequest
    case notFound
    case serverFailure
    case invalidUrl
    case nonHttpResponse
    case other
    case parsingError
    case requestFunctionNotImplemented
}

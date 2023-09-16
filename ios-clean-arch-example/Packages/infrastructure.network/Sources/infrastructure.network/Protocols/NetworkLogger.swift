import Foundation

public protocol NetworkLogger {
    func log(request: URLRequest)
    func log(response: URLResponse, data: Data?)
    func log(error: Error)
}

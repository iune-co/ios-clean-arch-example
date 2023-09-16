import Foundation

public final class NetworkLoggerImplementation: NetworkLogger {
    public func log(request: URLRequest) {
        let httpMethod = request.httpMethod ?? "HTTPMethod not specified"
        let path = request.url?.absoluteString ?? "Path not specified"
        let headers = request.allHTTPHeaderFields ?? [:]
        let bodyData = request.httpBody

        print("============================== \(httpMethod) REQUEST ==============================")
        print(path)

        print("============================== HEADERS ==============================")
        for (key, value) in headers {
            print("== \(key): \(value)")
        }
        print("============================== HEADERS END ==============================")

        do {
            try logData(data: bodyData)
        } catch {
            log(error: error)
        }

        print("============================== END \(httpMethod) ==============================\n\n\n")
    }

    public func log(response: URLResponse, data: Data?) {
        guard let response = response as? HTTPURLResponse else { return }
        let path = response.url?.absoluteString ?? "Path not specified"
        let headers = response.allHeaderFields

        print("============================= \(response.statusCode) RESPONSE ==============================")
        print(path)

        print("============================== HEADERS ==============================")
        for (key, value) in headers {
            print("== \(key): \(value)")
        }
        print("============================= HEADERS END ==============================")

        do {
            try logData(data: data)
        } catch {
            log(error: error)
        }

        print("============================== END RESPONSE \(response.statusCode) ==============================\n\n\n")
    }

    public func log(error: Error) {
        print("============================== Response Error ==============================")
        print(error.localizedDescription)
        print("============================== Response Error ==============================")
    }
}

// MARK: - Private Methods
extension NetworkLoggerImplementation {
    private func logData(data: Data?) throws {
        guard let jsonObject = try data.flatMap({ try JSONSerialization.jsonObject(with: $0, options: []) }),
              let jsonString = try String(data: JSONSerialization.data(
                withJSONObject: jsonObject,
                options: .prettyPrinted
              ), encoding: .utf8)
        else { return }

        print("============================== BODY ==============================")
        print(jsonString)
        print("============================== BODY END ==============================")
    }
}

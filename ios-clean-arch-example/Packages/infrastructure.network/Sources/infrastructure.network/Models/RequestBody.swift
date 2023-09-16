import Foundation

/// An enumerated type that represents the types of request bodies that can be used in a network request.
///
/// This enumeration defines four cases, each of which represents a different type of request body
/// that can be used in a network request:
///
/// - `.plain`: A plain-text request body with no additional encoding.
/// - `.encodable`: A request body that is encoded using `JSONEncoder`.
/// - `.queryParameter`: A request body that is encoded as a query string.
///
public enum RequestBody {
    case plain
    case encodable(Encodable)
    case queryParameter([String: Any?])
}

import Foundation

public struct Recipe: Decodable, Hashable, Identifiable {
    public let id: String
    public let name: String
    public let headline: String
    public let image: String
    public let preparationMinutes: Int
}

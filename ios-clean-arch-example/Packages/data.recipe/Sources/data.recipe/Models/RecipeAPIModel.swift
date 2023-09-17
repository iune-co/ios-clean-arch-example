public struct RecipeAPIModel: Decodable {
    public let id: String
    public let name: String
    public let headline: String
    public let image: String
    public let preparationMinutes: Int
}

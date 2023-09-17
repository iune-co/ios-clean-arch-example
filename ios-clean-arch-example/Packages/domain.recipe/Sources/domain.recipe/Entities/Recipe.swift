public struct Recipe {
    public let id: String
    public let name: String
    public let headline: String
    public let image: String
    public let preparationMinutes: Int
    
    public init(id: String, name: String, headline: String, image: String, preparationMinutes: Int) {
        self.id = id
        self.name = name
        self.headline = headline
        self.image = image
        self.preparationMinutes = preparationMinutes
    }
}

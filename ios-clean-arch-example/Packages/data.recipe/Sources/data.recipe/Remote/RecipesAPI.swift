import Foundation
import infrastructure_network

enum RecipesAPI: Endpoint {
    case getRecipes(page: Int)
    
    var baseURL: String {
        "https://localhost:8443/recipes"
    }
    
    var path: String {
        switch self {
            case .getRecipes(let page):
                return baseURL + "/\(page)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .getRecipes:
                return .get
        }
    }
    
    var headers: [String : String?]? {
        switch self {
            case .getRecipes:
                return ["Content-type": "application/json"]
        }
    }
    
    var body: RequestBody {
        switch self {
            case .getRecipes:
                return .plain
        }
    }
}

#  README

## Regarding some choices made

### async/await in Use Cases

*async/await* was chosen as a modern replacement for callback patterns, rather than coupling to a specific concurrency framework. Ideally, use cases would be completely insulated, but this was a pragmatic choice given Swift's language direction.

### DependencyContainer returns a concrete ```RecipesViewModelImplementation``` instead of its abstraction

Because of how `@StateObject` and `ObservableObject` works, it's difficult to design a protocol for the `RecipesViewModel`. Because `ObservableObject` conformance introduces an associated type, it's not possible to resolve a `RecipesViewModel` from the dependency container. On the other hand, this requires that the `RecipesScreen` should declare a `@StateObject private var viewModel: any RecipesViewModel`, which is not what we're looking for. So a `ViewModel` protocol was created, which declares and implements a simple `updateUI` method, which (you guessed it), allows implementations to update the UI! Just as in *async/await*, Swift and SwiftUI's features (although powerful and easy to use), place some constraints which are hard to break when trying to go Clean.


## Improvements

### Accessors should be reviewed
At this time, it's still WIP, so it needs revision.

### Return instances with mock or generated data to be used in Previews. For instance, in DependencyManager:
```
extension DependencyManager {
    public static func toPreviewInstance() -> DependencyManager {
        DependencyManager(
            storage: DependencyStorageImplementation(),
            serviceRegisters: [
                DataRecipeServiceRegister(),
                FeatureRecipeServiceRegister(),
                NetworkServiceRegister()
            ]
        )
    }
}
```

### Public access on some protocol methods should be made private

Guess there's no way around this using protocols 🤷‍♂️


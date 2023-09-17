#  README

## Regarding some choices made

### async/await in Use Cases

*async/await* was chosen as a modern replacement for callback patterns, rather than coupling to a specific concurrency framework. Ideally, use cases would be completely insulated, but this was a pragmatic choice given Swift's language direction.


## Improvements

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

// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "feature.recipe",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "feature.recipe",
            targets: ["feature.recipe"]
        ),
    ],
    dependencies: [
        .package(path: "../domain.recipe"),
        .package(path: "../infrastructure.feature"),
        .package(path: "../infrastructure.dependencyContainer")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "feature.recipe",
            dependencies: [
                .product(
                    name: "domain.recipe",
                    package: "domain.recipe"
                ),
                .product(
                    name: "infrastructure.feature",
                    package: "infrastructure.feature"
                ),
                .product(
                    name: "infrastructure.dependencyContainer",
                    package: "infrastructure.dependencyContainer"
                )
            ]
        ),
        .testTarget(
            name: "feature.recipeTests",
            dependencies: ["feature.recipe"]
        ),
    ]
)

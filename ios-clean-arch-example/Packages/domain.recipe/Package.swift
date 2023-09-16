// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "domain.recipe",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "domain.recipe",
            targets: ["domain.recipe"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../infrastructure.dependencyContainer")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "domain.recipe",
            dependencies: [
                .product(
                    name: "infrastructure.dependencyContainer",
                    package: "infrastructure.dependencyContainer"
                )
            ]
        ),
        .testTarget(
            name: "domain.recipeTests",
            dependencies: ["domain.recipe"]
        ),
    ]
)
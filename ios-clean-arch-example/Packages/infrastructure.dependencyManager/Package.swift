// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "infrastructure.dependencyManager",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "infrastructure.dependencyManager",
            targets: ["infrastructure.dependencyManager"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            name: "infrastructure.dependencyContainer",
            path: "../infrastructure.dependencyContainer"
        ),
        .package(
            name: "domain.recipe",
            path: "../domain.recipe"
        ),
        .package(
            name: "data.recipe",
            path: "../data.recipe"
        ),
        .package(
            name: "feature.recipe",
            path: "../feature.recipe"
        ),
        .package(
            name: "infrastructure.network",
            path: "../infrastructure.network"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "infrastructure.dependencyManager",
            dependencies: [
                .product(
                    name: "infrastructure.dependencyContainer",
                    package: "infrastructure.dependencyContainer"
                ),
                .product(
                    name: "domain.recipe",
                    package: "domain.recipe"
                ),
                .product(
                    name: "data.recipe",
                    package: "data.recipe"
                ),
                .product(
                    name: "feature.recipe",
                    package: "feature.recipe"
                ),
                .product(
                    name: "infrastructure.network",
                    package: "infrastructure.network"
                ),
            ]
        ),
        .testTarget(
            name: "infrastructure.dependencyManagerTests",
            dependencies: ["infrastructure.dependencyManager"]
        ),
    ]
)

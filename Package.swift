// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FunctionCalling-FirebaseVertexAI",
    platforms: [
        .macOS(.v13),
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FunctionCalling-FirebaseVertexAI",
            targets: ["FunctionCalling-FirebaseVertexAI"])
    ],
    dependencies: [
        .package(url: "https://github.com/fumito-ito/FunctionCalling", from: "0.5.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "11.14.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FunctionCalling-FirebaseVertexAI",
            dependencies: [
                .product(name: "FunctionCalling", package: "FunctionCalling"),
                .product(name: "FirebaseVertexAI", package: "firebase-ios-sdk")
            ]
        ),
        .testTarget(
            name: "FunctionCalling-FirebaseVertexAITests",
            dependencies: ["FunctionCalling-FirebaseVertexAI"])
    ]
)

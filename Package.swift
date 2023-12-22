// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftJsonDataModel",
    platforms: [ .macOS(.v14), .iOS(.v17) ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "JsonDataModel", targets: ["JsonDataModel"]),
        .executable(name: "Development", targets: ["Development"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "JsonDataModel"),
        .executableTarget(name: "Development", dependencies: ["JsonDataModel"]),
        .testTarget(name: "JsonDataModelTests", dependencies: ["JsonDataModel"]),
    ]
)

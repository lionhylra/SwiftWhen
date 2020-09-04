// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftWhen",
    products: [
        .library(
            name: "SwiftWhen",
            targets: ["SwiftWhen"]),
    ],
    targets: [
        .target(
            name: "SwiftWhen",
            dependencies: []),
        .testTarget(
            name: "SwiftWhenTests",
            dependencies: ["SwiftWhen"]),
    ]
)

// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ViewDSL",
    platforms: [
        .macOS(.v10_11),
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "ViewDSL", 
            targets: ["ViewDSL"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ViewDSL",
            dependencies: []),
        .testTarget(
            name: "ViewDSLTests",
            dependencies: []),
    ]
)

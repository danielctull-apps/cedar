// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "Cedar",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        .executable(name: "cedar", targets: ["Cedar"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(name: "Cedar", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
        ]),
    ]
)

// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Cedar",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .executable(name: "cedar", targets: ["Cedar"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.2.0"),
    ],
    targets: [
        .target(name: "Cedar", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
        ]),
    ]
)

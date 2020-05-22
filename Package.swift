// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Cedar",
    products: [
        .executable(name: "cedar", targets: ["Cedar"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Cedar",
            dependencies: []),
    ]
)

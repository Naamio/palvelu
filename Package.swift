// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Palvelu",
    products: [
        .library(
            name: "Palvelu",
            targets: ["Palvelu"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Palvelu",
            dependencies: []),
        .testTarget(
            name: "PalveluTests",
            dependencies: ["Palvelu"]),
    ]
)

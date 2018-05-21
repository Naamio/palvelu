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
        .package(url: "https://github.com/apple/swift-nio", .upToNextMajor(from: "1.7.0")),
        .package(url: "https://github.com/IBM-Swift/Kitura", .upToNextMajor(from: "2.3.0")),
    ],
    targets: [
        .target(
            name: "Palvelu",
            dependencies: ["Kitura", "NIO"]),
    ]
)

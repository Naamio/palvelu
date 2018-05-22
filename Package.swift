// swift-tools-version:4.0

import PackageDescription

private func getTargetPath(_ name: String, for type: String) -> String {
    return "\(type)/\(name)"
}

private func getSourcePath(_ name: String) -> String {
    return getTargetPath(name, for: "Sources")
}

private func getTestPath(_ name: String) -> String {
    return getTargetPath(name, for: "Tests")
}

let package = Package(
    name: "Palvelu",
    products: [
        .library(
            name: "Palvelu",
            targets: ["PalveluService"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio", .upToNextMajor(from: "1.7.0")),
        .package(url: "https://github.com/IBM-Swift/Kitura", .upToNextMajor(from: "2.3.0")),
    ],
    targets: [
        .target(
            name: "PalveluService",
            dependencies: ["PalveluData", "Kitura", "NIO"],
            path: getSourcePath("Service"),
            sources: ["."]
        ),
        .target(
            name: "PalveluData",
            dependencies: [],
            path: getSourcePath("Data"),
            sources: ["."]
        ),
        .testTarget(
            name: "PalveluDataTests",
            dependencies: ["PalveluData"],
            path: getTestPath("Data"),
            sources: ["."]
        )
    ]
)

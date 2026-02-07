// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "UXKit",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .tvOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "UXKit",
            targets: ["UXKit"]
        )
    ],
    dependencies: [
        // Add dependencies here
    ],
    targets: [
        .target(
            name: "UXKit",
            dependencies: [],
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
        .testTarget(
            name: "UXKitTests",
            dependencies: ["UXKit"]
        )
    ]
)

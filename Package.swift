// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "PortfolioAppsKit",
    platforms: [
        .iOS(.v18),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "PortfolioAppsKit",
            targets: ["PortfolioAppsKit"]
        )
    ],
    targets: [
        .target(
            name: "PortfolioAppsKit",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "PortfolioAppsKitTests",
            dependencies: ["PortfolioAppsKit"]
        )
    ]
)

// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SuperEasyLayout",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "SuperEasyLayout", targets: ["SuperEasyLayout"]),
    ],
    targets: [
        .target(
            name: "SuperEasyLayout",
            dependencies: []),
    ]
)

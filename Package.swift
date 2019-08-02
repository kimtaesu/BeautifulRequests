// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "BeautifulRequests",
    products: [
        .library(
            name: "BeautifulRequests",
            targets: ["BeautifulRequests"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BeautifulRequests",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "BeautifulRequestsTests",
            dependencies: ["BeautifulRequests"],
            path: "Tests"
        ),
    ]
)

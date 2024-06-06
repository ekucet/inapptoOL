// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "inapptoOL",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "inapptoOL",
            targets: ["inapptoOL"]),
    ],
    dependencies: [
        .package(url: "https://github.com/siteline/swiftui-introspect", exact: "1.1.4"),
    ],
    targets: [
        .target(
            name: "inapptoOL",
            dependencies: [
                .product(name: "SwiftUIIntrospect", package: "swiftui-introspect")
            ]),
        .testTarget(
            name: "inapptoOLTests",
            dependencies: ["inapptoOL"]),
    ]
)

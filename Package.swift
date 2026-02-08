// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftfulOnboarding",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftfulOnboarding",
            targets: ["SwiftfulOnboarding"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "3.0.0"),
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftfulOnboarding",
            dependencies: [
                "SDWebImageSwiftUI",
                .product(name: "Lottie", package: "lottie-ios")
            ]),
        .testTarget(
            name: "SwiftfulOnboardingTests",
            dependencies: ["SwiftfulOnboarding"]
        ),
    ]
)

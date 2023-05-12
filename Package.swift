// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShopliveShortformSDK",
    platforms: [.iOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ShopliveShortformSDK",
            targets: ["ShopliveShortformSDK","ShopLiveSDKCommonTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/shoplive/common-ios.git", .upToNextMajor(from: "1.4.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: "ShopliveShortformSDK",
                      path: "./Frameworks/ShopliveShortformSDK.xcframework"),
        
        .target(name: "ShopLiveSDKCommonTarget",
                dependencies: [.product(name: "ShopliveSDKCommon", package: "common-ios")])
    ]
)


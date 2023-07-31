

// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShopliveShortformSDK",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "ShopliveShortformSDK",
            targets: ["ShopLiveShortformSDK"])
    ],
    
    targets: [
        .binaryTarget(name: "ShopLiveShortformSDK",
                      path: "./Frameworks/ShopLiveShortformSDK.xcframework")
    ]
)


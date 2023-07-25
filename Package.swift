

// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShopliveShortformSDK",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "ShopliveShortformSDK",
            targets: ["ShopLiveShortformSDK","ShopLiveShortformUploadSDK","ShopLiveSDKCommonTarget","FFmpegKitTarget"])
    ],
    dependencies: [
        .package(url: "https://github.com/shoplive/common-ios.git", .exact("1.4.4"))
    ],
    targets: [
        .binaryTarget(name: "ShopLiveShortformSDK",
                      path: "./Frameworks/ShopLiveShortformSDK.xcframework"),
        
        .target(name: "ShopLiveSDKCommonTarget",
                dependencies: [.product(name: "ShopliveSDKCommon", package: "common-ios")])
    ]
)


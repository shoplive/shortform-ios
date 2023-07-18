

// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShopliveShortformSDK",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "ShopliveShortformSDK",
            targets: ["ShopLiveShortformSDK","ShopLiveSDKCommonTarget","ffmpegkit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/shoplive/common-ios.git", .exact("1.4.1")),
        .package(url: "https://github.com/shoplive/ffmpeg-kit-spm.git", .exact("5.1.2"))
    ],
    targets: [
        .binaryTarget(name: "ShopLiveShortformSDK",
                      path: "./Frameworks/ShopLiveShortformSDK.xcframework"),
        
        .target(name: "ShopLiveSDKCommonTarget",
                dependencies: [.product(name: "ShopliveSDKCommon", package: "common-ios")]),
        
        .target(name: "ffmpegkit",
                dependencies: [.product(name: "ffmpegkit", package: "ffmpeg-kit-spm")])
    ]
)


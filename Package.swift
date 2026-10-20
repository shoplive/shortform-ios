// swift-tools-version: 5.9
// ShopLiveShortformSDK — Shoplive iOS 숏폼 SDK 배포 매니페스트.
//
// 숏폼은 Common(ShopliveSDKCommon · ShopliveAPI)을 런타임에 링크한다. Common 은 shoplive/common-ios 패키지에서 받는다.
// 라이브 SDK 1.x(shoplive-sdk-ios)도 같은 common-ios 를 의존으로 선언하므로 SwiftPM 이 Common 을 한 번만 해석하고,
// 라이브 3.x 와 함께 넣어도 패키지 버전 충돌이 나지 않는다.

import PackageDescription

let commonVersion = "1.9.0"

let package = Package(
    name: "ShopliveShortformSDK",
    platforms: [
        // Common 1.9.0 바이너리 기준
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ShopliveShortformSDK",
            targets: ["ShopLiveShortformSDK", "ShopLiveShortformSDKDependencies"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/shoplive/common-ios", exact: Version(stringLiteral: commonVersion))
    ],
    targets: [
        .binaryTarget(
            name: "ShopLiveShortformSDK",
            path: "./Frameworks/ShopLiveShortformSDK.xcframework"
        ),
        // 링크 전용 — binaryTarget 은 다른 패키지 product 에 의존할 수 없어 이 타깃이 Common 을 끌어온다.
        .target(
            name: "ShopLiveShortformSDKDependencies",
            dependencies: [
                .product(name: "ShopliveSDKCommon", package: "common-ios")
            ],
            path: "Sources/ShopLiveShortformSDKDependencies"
        )
    ]
)

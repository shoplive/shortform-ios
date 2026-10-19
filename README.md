# iOS ShopLiveShortform SDK

## 요구사항

- iOS 15 이상 (1.9.0 부터. Common 1.9.0 기준)

## 버전 호환

| 숏폼 | Common | 라이브 SDK |
|---|---|---|
| **1.9.0** | 1.9.0 (`shoplive/common-ios`) | 1.x(`shoplive-sdk-ios` 1.9.1~) · 3.x(`shoplive-sdk-ios` 3.0.3~) 모두 |
| 1.8.13 | ≤ 1.8.14 | ShopLive ≤ 1.8.14 |

> ⚠️ 숏폼 1.8.13 은 Common 1.8.15 이상(1.9.0 포함)과 함께 쓸 수 없습니다(실행 즉시 `Symbol not found`).

## Swift Package Manager

`Package.swift` 의 `dependencies` 에 추가합니다. 버전은 `exact` 로 고정합니다.

```swift
dependencies: [
    .package(url: "https://github.com/shoplive/shortform-ios", exact: "1.9.0")
    // Common(shoplive/common-ios 1.9.0)은 숏폼이 의존으로 함께 가져옵니다.
]
```

앱 코드에서 `import ShopliveSDKCommon` 을 쓰면 `common-ios` 도 명시합니다.

```swift
.package(url: "https://github.com/shoplive/common-ios", exact: "1.9.0")
```

라이브 SDK 와 함께 쓸 때는 라이브 패키지를 그대로 추가하면 됩니다. 라이브 1.x 와 숏폼이 같은 `common-ios` 를 공유하고,
라이브 3.x 는 Common 대신 `ShopliveCore` 를 쓰므로 둘이 함께 들어갑니다(초기화는 각각).

## CocoaPods

```ruby
source 'https://cdn.cocoapods.org/'
source 'https://github.com/shoplive/pod-specs.git'

pod 'ShopliveShortformSDK', '1.9.0'   # ShopliveSDKCommon 1.9.0 을 의존으로 가져옵니다
```

# IOS ShopLiveShortForm SDK

## 요구사항

- ios 11 이상

## 설치
<br>

## SwiftPackageManager
SPM을 사용하여 다운로드 받을시 `Package.swift`파일의 `dependencies`에 다음과 같이 추가하여 사용할 수 있습니다.

```swift
dependencies: [
    //common의 버전과 shortform의 버전을 맞춰서 다운로드 받는 것을 권장합니다.
    .package(url: "https://github.com/shoplive/shortform-ios", .upToNextMajor(from: "1.4.8"))  
    .package(url: "https://github.com/shoplive/common-ios", .upToNextMajor(from: "1.4.8"))
]
```

## CocoaPod
CocoaPod을 사용하여 다운로드 받을시 Podfile에 다음과 같이 추가하여 사용할 수 있습니다.

```ruby
pod 'ShopliveShortformSDK', '1.4.8'
pod 'ShopliveSDKCommon', '1.4.8'
```


# Changelog

## 1.9.1

### Requirements

- iOS 15.0 or later.
- Requires ShopliveSDKCommon 1.9.0 (`shoplive/common-ios`). SwiftPM and CocoaPods resolve it automatically.
- Using with the ShopLive live SDK 1.x: SwiftPM needs `shoplive-sdk-ios` 1.9.1 or later; CocoaPods works with `ShopLive` 1.9.0 or later.
- Shortform 1.8.13 does not run with ShopliveSDKCommon 1.8.15 or later (including 1.9.0). Update Shortform and the Editor to 1.9.1 together.

### Added

- `ShopLiveShortformDelegate` — the new event delegate. All methods are optional:
  - `onProductClick(shortsId:shortsSrn:product:)`
  - `onBannerClick(shortsId:shortsSrn:url:)`
  - `onShare(shareData:)` / `onShare(url:)` (if `onShare(url:)` is not implemented, the system share sheet is shown)
  - `onEvent(messenger:command:payload:)` — `payload` is `[String: Any]?`
  - `onError(error:)`
  - `onDetailShown()` / `onDetailHidden()`
  - `onShortsAttached(data:)` / `onShortsDetached(data:)`
- `ShopLiveShortformMoreDelegate` — paging for ID-list playback: `onMore(completion:)` / `onPrevious(completion:)`.
- List views you create directly as `UIView`s: `ShopLiveShortformCardTypeView`, `ShopLiveShortformVerticalTypeView`, `ShopLiveShortformHorizontalTypeView`. Create the view, call the setters, then `submit()`. Delegates: `listViewDelegate`, `shortsCollectionDelegate`.
- Per-call `referrer`: `ShopLiveShortformCollectionData(referrer:)`, `ShopLiveShortformIdsData(referrer:)`, `ShopLiveShortformRelatedData(referrer:)`, `ShopLiveShortformPreviewData(referrer:)`, and list view `setReferrer(_:)` / `referrer`.
- `ShopLiveShortform.showPreview(requestData:)` for `ShopLiveShortformPreviewData`.

### Changed

- The `delegate` of the request data types is now `ShopLiveShortformDelegate`. Objects that still conform to the deprecated `ShopLiveShortformReceiveHandlerDelegate` keep working: the SDK calls the new method when it is implemented and falls back to the old one otherwise. The old `onEvent` still receives the JSON string.
- A `referrer:` passed to a data initializer is used for that call only. It is no longer stored globally (it does not carry over to later screens), and creating data without a referrer no longer clears the global value.
- List views and the deprecated Builders hold their delegates weakly. Keep a strong reference to your delegate (for example, the owning view controller).

### Deprecated

- `ShopLiveShortformReceiveHandlerDelegate` — use `ShopLiveShortformDelegate`.
- `ShortsCollectionViewDataSourcRequestDelegate` — use `ShopLiveShortformMoreDelegate`.
- `ShopLiveShortform.CardTypeViewBuilder`, `ShopLiveShortform.ListViewBuilder` and `ListViewBaseBuilder` — use the list view classes above.
- `ShopLiveShortform.setReferrer(referrer:)` — pass `referrer` per call. The global value is used only when no per-call value is given.
- `ShopLiveShortform.play(requestData: ShopLiveShortformPreviewData?)` — use `showPreview(requestData:)`.
- Typo fixes (the old names remain as deprecated aliases):

  | Deprecated | Use |
  |---|---|
  | `ShopLiveShortform.setVisibileDetailViews(options:)` | `setVisibleDetailViews(options:)` |
  | `ShopLiveShortform.setEnableResumeOnForeGround(enable:)` | `setEnableResumeOnForeground(enable:)` |
  | `ShopLiveShortformVisibleDetailData.isBookMarkVisible`, `init(isBookMarkVisible:…)` | `isBookmarkVisible`, `init(isBookmarkVisible:…)` |
  | `setVisibleTitle(isVisisble:)` (Builders) | `setVisibleTitle(isVisible:)` |
  | `onShortformListDownwardPagination(completion:)` | `onMore(completion:)` |
  | `onShortformListUpwardPagingation(completion:)` | `onPrevious(completion:)` |

### Migrating from `ShopLiveShortformReceiveHandlerDelegate`

Important: if you only change the conformance to `ShopLiveShortformDelegate`, methods with the old names are no longer called. Rename them as well:

| Old method | New method |
|---|---|
| `handleProductItem(shortsId:shortsSrn:product:)` | `onProductClick(shortsId:shortsSrn:product:)` |
| `handleProductBanner(shortsId:shortsSrn:scheme:)` | `onBannerClick(shortsId:shortsSrn:url:)` |
| `handleShare(shareMetadata:)` | `onShare(shareData:)` |
| `handleShare(shareUrl:)` | `onShare(url:)` |
| `onEvent(messenger:command:payload:)` with `payload: String?` (JSON) | `onEvent(messenger:command:payload:)` with `payload: [String: Any]?` |
| `onDidAppear()` | `onDetailShown()` |
| `onDidDisAppear()` | `onDetailHidden()` |

`onError(error:)`, `onShortsAttached(data:)` and `onShortsDetached(data:)` keep their names.

### Breaking changes

- `ShopLiveShortformPreviewData` is no longer a subclass of `ShopLiveShortformRelatedData`. Code that casts it to `ShopLiveShortformRelatedData` must be updated (`play(requestData:)` still accepts it through a deprecated overload).
- Code that reads `data.delegate` and calls the old methods on it (for example `data.delegate?.handleProductItem?(...)`) must use the new method names.
- Delegates set on list views and Builders are held weakly. A delegate that nothing else retains is released and stops receiving callbacks.
- Editor option type changes are listed in the ShopLiveShortformEditorSDK 1.9.1 changelog (`shoplive/shortform-editor-ios`).

// 링크 전용 타깃.
//
// binaryTarget 은 다른 패키지의 product 에 의존을 걸 수 없다. 숏폼 바이너리가 런타임에 링크하는
// ShopliveSDKCommon(common-ios)을 함께 해석·링크되게 하려고 이 소스 타깃을 product 에 같이 싣는다.
import ShopliveSDKCommon

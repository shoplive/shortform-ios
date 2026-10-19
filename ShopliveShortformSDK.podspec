Pod::Spec.new do |spec|
  spec.name         = "ShopliveShortformSDK"
  spec.version      = "1.9.0"
  spec.summary      = "ShopLive Shortform Framework for iOS"

  spec.homepage     = "http://shoplive.cloud"
  spec.source   = { :git => 'https://github.com/shoplive/shortform-ios.git', :tag => spec.version.to_s }
  spec.license = { :type => 'Copyright', :text => <<-LICENSE
                 Copyright 2021
                 Permission is granted to...
                 LICENSE
              }

  spec.author             = { "Shoplive" => "shoplive-eng@shoplive.cloud" }
  spec.platform     = :ios
  spec.ios.deployment_target = '15.0'
  spec.swift_version = "5"
  spec.vendored_frameworks = 'Frameworks/ShopLiveShortformSDK.xcframework'
  # 숏폼은 Common 을 런타임에 링크한다 — 라이브 SDK 1.x 와 같은 버전으로 맞춘다.
  spec.dependency 'ShopliveSDKCommon', '1.9.0'
  
end

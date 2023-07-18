Pod::Spec.new do |spec|
  spec.name         = "ShopliveShortformSDK"
  spec.version      = "1.4.1"
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
  spec.ios.deployment_target = '12.0'
  spec.swift_version = "5"
  spec.vendored_frameworks = 'Frameworks/ShopLiveShortformSDK.xcframework' , 'Frameworks/ShopLiveShortformUploadSDK.xcframework'
  spec.dependency "ShopliveSDKCommon", "~> 1.4.1"
  spec.dependency "ffmpeg-kit-ios-min-gpl", "~> 5.1"
end

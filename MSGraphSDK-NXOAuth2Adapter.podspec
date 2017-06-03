
Pod::Spec.new do |s|

  s.name         = "MSGraphSDK-NXOAuth2Adapter"
  s.version      = "0.9.2"
  s.summary      = "Limited-scope OAuth2 implementation using the NXOAuth2 library for use with the Microsoft Graph SDK"
  s.description  = <<-DESC
                    Limited-scope implementation of MSAuthenticationProvider that can perform UI login for apps registered on apps.dev.microsoft.com
                   DESC
  s.homepage     = "http://azure.microsoft.com/en-us/documentation/articles/active-directory-v2-protocols-oauth-code/"
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }
  s.author        = 'Microsoft Graph'

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/MicrosoftGraph/msgraph-sdk-ios-nxoauth2-adapter",
                     :tag => "#{s.version}" }

  s.source_files = "MSGraphSDKNXOAuth2/MSGraphSDKNXOAuth2.h"
  s.public_header_files = "MSGraphSDKNXOAuth2/MSGraphSDKNXOAuth2.h"

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = "MSGraphSDKNXOAuth2/Common/*.{h,m}", "MSGraphSDKNXOAuth2/Auth/*.{h,m}", "MSGraphSDKNXOAuth2/Extensions/*.{h,m}"
    core.public_header_files = "MSGraphSDKNXOAuth2/Common/*.h", "MSGraphSDKNXOAuth2/Auth/*.h", "MSGraphSDKNXOAuth2/Extensions/*.h"
    core.dependency 'NXOAuth2Client/Core', '~> 1.2.8'
    core.dependency 'MSGraphSDK/Common'
    core.dependency 'MSGraphSDK/Implementations'
  end

  s.subspec 'AppExtension' do |ext|
    ext.source_files = "MSGraphSDKNXOAuth2/Common/*.{h,m}", "MSGraphSDKNXOAuth2/Auth/*.{h,m}", "MSGraphSDKNXOAuth2/Extensions/*.{h,m}"
    ext.public_header_files = "MSGraphSDKNXOAuth2/Common/*.h", "MSGraphSDKNXOAuth2/Auth/*.h", "MSGraphSDKNXOAuth2/Extensions/*.h"
    ext.dependency 'NXOAuth2Client/AppExtension', '~> 1.2.8'
    ext.dependency 'MSGraphSDK/Common'
    ext.dependency 'MSGraphSDK/Implementations'
    ext.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'MS_APP_EXTENSIONS=1' }
  end
end

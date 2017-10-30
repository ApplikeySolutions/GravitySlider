#
# Be sure to run `pod lib lint GravitySliderFlowLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GravitySliderFlowLayout'
  s.version          = '1.0'
  s.summary          = 'GravitySlider is a beautiful alternative to the standard UICollectionView flow layout.'
  s.description      = <<-DESC
GravitySlider is a lightweight animation flowlayot for UICollectionView completely written in Swift 4, compatible with iOS 11 and xCode 9.
                       DESC

  s.homepage         = 'https://github.com/ApplikeySolutions/GravitySlider'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Applikey Solutions' => 'welcome@applikeysolutions.com' }
  s.source           = { :git => 'https://github.com/AppliKeySolutions/GravitySlider.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/Applikey_'

  s.ios.deployment_target = '9.0'

  s.source_files = 'GravitySliderFlowLayout/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GravitySliderFlowLayout' => ['GravitySliderFlowLayout/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

#
# Be sure to run `pod lib lint GravitySlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GravitySlider'
  s.version          = '1.0'
  s.summary          = 'GravitySlider is a beautiful alternative to the standard UICollectionView flow layout.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
GravitySlider is a lightweight animation flowlayot for UICollectionView completely written in Swift 4, compatible with iOS 11 and xCode 9.
                       DESC

  s.homepage         = 'https://github.com/ApplikeySolutions/GravitySlider'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ApplikeySolutions' => 'welcome@applikeysolutions.com' }
  s.source           = { :git => 'https://github.com/ApplikeySolutions/GravitySlider.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/Applikey_'

  s.ios.deployment_target = '9.0'

  s.source_files = 'GravitySlider/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GravitySlider' => ['GravitySlider/Assets/*.png']
  # }

end

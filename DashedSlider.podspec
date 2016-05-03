#
# Be sure to run `pod lib lint DashedSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DashedSlider"
  s.version          = "0.2.0"
s.summary          = "Dashed-style UISlider written in Swift"

  s.description      = <<-DESC
DashedSlider is a subclass of UISlider. You can easily make dashed-style sliders and customize it.
                       DESC

  s.homepage         = "https://github.com/ayalcinkaya/DashedSlider"
  s.screenshots     = "https://raw.githubusercontent.com/ayalcinkaya/DashedSlider/master/images/ss.png"
  s.license          = 'MIT'
  s.author           = { "ayalcinkaya" => "ahmetyk@gmail.com" }
  s.source           = { :git => "https://github.com/ayalcinkaya/DashedSlider.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/ayalcinkaya_'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DashedSlider' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit','CoreGraphics'
  # s.dependency ''
end

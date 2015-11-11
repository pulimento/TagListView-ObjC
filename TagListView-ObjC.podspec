#
# Be sure to run `pod lib lint TagListView-ObjC.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TagListView-ObjC"
  s.version          = "0.1.1"
  s.summary          = "Simple but highly customizable iOS tag list view, in Objective-C."
  s.description      = <<-DESC
                        "Simple but highly customizable iOS tag list view, in Objective-C. Based on Swift version by XHacker"
                       DESC
  s.homepage         = "https://github.com/pulimento/TagListView-ObjC"
  # s.screenshots     = "https://raw.githubusercontent.com/pulimento/TagListView-ObjC/master/Screenshots/Interface%20Builder.png", "https://raw.githubusercontent.com/pulimento/TagListView-ObjC/master/Screenshots/Screenshot.png"
  s.license          = 'MIT'
  s.author           = { "Javi Pulido" => "pulimento+github@gmail.com" }
  s.source           = { :git => "https://github.com/pulimento/TagListView-ObjC.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

s.source_files = 'TagListView/{*.h,*.m}'
  s.resource_bundles = {
    'TagListView-ObjC' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

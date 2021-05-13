#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_pingpp.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_pingpp'
  s.version          = '0.2.1'
  s.swift_version = '4.0'
  s.summary          = 'Wechat SDK flutter plugin'
  s.description      = <<-DESC
Wechat SDK flutter plugin
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.dependency 'Pingpp', '~> 2.2.34'
  s.ios.deployment_target = '10.0'
  s.static_framework = true
end

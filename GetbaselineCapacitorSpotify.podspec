require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name = 'GetbaselineCapacitorSpotify'
  s.version = package['version']
  s.summary = package['description']
  s.license = package['license']
  s.homepage = package['repository']['url']
  s.author = package['author']

  s.source = { :git => package['repository']['url'], :tag => s.version.to_s, :submodules => true }
  s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
  s.preserve_path = "ios/external/ios-sdk/SpotifyiOS.framework"
  s.vendored_frameworks = "ios/external/ios-sdk/SpotifyiOS.framework"

  s.ios.deployment_target  = '13.0'
  s.dependency 'Capacitor'
  s.swift_version = '5.1'
end

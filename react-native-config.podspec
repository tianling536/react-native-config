require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-config"
  s.version      = package["version"]
  s.summary      = "Expose config variables to React Native apps"
  s.author       = "Pedro Belo"

  s.homepage     = "https://github.com/luggit/react-native-config"

  s.license      = "MIT"
  s.ios.deployment_target = "7.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/luggit/react-native-config.git", :tag => "#{s.version}" }
  s.preserve_path = "ios/**/*.{ruby}"

  s.source_files  = "ios/**/*.{h,m,ruby}"
  s.requires_arc = true
  
  s.script_phase = { :name => "BuildDotenvConfig",
    :script => "${PODS_TARGET_SRCROOT}/ios/ReactNativeConfig/BuildDotenvConfig.ruby", :execution_position => :before_compile }

  s.dependency "React"
end

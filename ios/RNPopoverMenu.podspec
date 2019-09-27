
require 'json'

package = JSON.parse(File.read(File.join(__dir__, '../package.json')))

Pod::Spec.new do |s|
  s.name         = "RNPopoverMenu"
  s.version      = package['version']
  s.summary      = "RNPopoverMenu"
  s.description  = <<-DESC
This library is a React Native bridge around native popover libraries. It allows show/guide beautiful popover menus.
                   DESC
  s.homepage     = "https://github.com/prscX/react-native-popover-menu"
  s.license      = { type: "Apache License", file: "../LICENSE" }
  s.author       = { "author" => "Pranav Raj Singh Chauhan" }
  s.platforms    = { ios: "7.0" }
  s.source       = { git: "https://github.com/author/RNPopoverMenu.git" }
  s.source_files = "**/*.{h,m}"
  s.requires_arc = true

  s.dependency 'React'
  s.dependency 'FTPopOverMenu', '~> 2.0.2'
end

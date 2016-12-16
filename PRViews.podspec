Pod::Spec.new do |s|
 
  # 1
  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.name = "PRViews"
  s.summary = "Customizable forms views"
  s.requires_arc = true
 
  # 2
  s.version = "0.2"
 
  # 3
  s.license = { :type => "MIT", :file => "LICENSE" }
 
  # 4 - Replace with your name and e-mail address
  s.author = { "Pedro" => "p.rothen@outlook.cl" }
 
  # 5 - Replace this URL with your own Github page's URL (from the address bar)
  s.homepage = "https://github.com/p-rothen"
 
  # 6 - Replace this URL with your own Git URL from "Quick Setup"
  s.source = { :git => "https://github.com/p-rothen/PRViews.git", :tag => "#{s.version}"}
 
  # 7
  s.framework = "UIKit"
  s.dependency 'CZPicker'
 
  # 8
  s.source_files = "PRViews/**/*.{swift}"
 
  # 9
  s.resources = "PRViews/**/*.{png,jpeg,jpg,storyboard,xib}"
end
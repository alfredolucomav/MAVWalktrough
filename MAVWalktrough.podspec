Pod::Spec.new do |s|
  # 1
  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.name  = "MAVWalktrough"
  s.summary = "Walktrough"
  s.requires_arc = true

  # 2
  s.version      = "0.0.1"

  # 3
  s.license = { :type => "MIT", :file => "LICENSE" }

  # 4
  s.author = { "aluco" => "aluco100@gmail.com" }

  # 5
  # TODO
  s.homepage = "https://github.com/aluco100/SVDismissableProgressHUD"

  # 6
  # TODO
  s.source = { :git => "https://github.com/aluco100/SVDismissableProgressHUD", :tag => "0.0.6" }

  # 7
  s.ios.frameworks = 'UIKit', 'Foundation'
  s.dependency 'MaterialComponents/Buttons'

  # 8
  s.ios.source_files = 'MAVWalktrough/Sources/**/*.*'

end


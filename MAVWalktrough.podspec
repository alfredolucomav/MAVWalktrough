Pod::Spec.new do |s|
  # 1
  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.name  = "MAVWalktrough"
  s.summary = "Walktrough"
  s.requires_arc = true

  # 2
  s.version      = "0.0.2"

  # 3
  s.license = { :type => "MIT", :file => "LICENSE" }

  # 4
  s.author = { "alfredolucomav" => "alfredo.luco@mavericks.cool" }

  # 5
  s.homepage = "https://github.com/alfredolucomav/MAVWalktrough"

  # 6
  s.source = { :git => "https://github.com/alfredolucomav/MAVWalktrough", :tag => "0.0.2" }

  # 7
  s.ios.frameworks = 'UIKit', 'Foundation'
  s.dependency 'MaterialComponents/Buttons'

  # 8
  s.ios.source_files = 'MAVWalktrough/Sources/**/*.*'

end


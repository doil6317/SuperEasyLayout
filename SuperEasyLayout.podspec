Pod::Spec.new do |s|
  s.name             = 'SuperEasyLayout'
  s.version          = '0.3.0'
  s.summary          = 'Super Easy Auto Layout Library'
  s.description      = <<-DESC
                         SuperEasyAutoLayout is a library that allows you to define AutoLayout more easily in the source code.
                       DESC
  s.homepage         = 'https://github.com/doil6317/SuperEasyLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'doil6317' => 'doil6317@gmail.com' }
  s.source           = { :git => 'https://github.com/doil6317/SuperEasyLayout.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files     = 'Sources/SuperEasyLayout/Classes/**/*.swift'
  s.swift_version    = '5.1'
end

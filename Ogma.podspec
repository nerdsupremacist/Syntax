Pod::Spec.new do |s|
  s.name             = 'Ogma'
  s.version          = '0.1.1'
  s.summary          = 'Framework for Parsing in Swift using pure functions'

  s.description      = 'Ogma is a lightweight Parsing Framework written in Swift. Say goodbye to complicated state machines! Now you can easily write a Parser using only pure functions.'

  s.homepage         = 'https://github.com/nerdsupremacist/Ogma'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mathiasquintero' => 'me@quintero.io' }
  s.source           = { :git => 'https://github.com/nerdsupremacist/Ogma.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/nerdsupremacist'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Ogma/Classes/**/*'

  s.swift_version = '4.2'
end

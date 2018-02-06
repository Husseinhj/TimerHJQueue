Pod::Spec.new do |s|

  s.name         = "TimerHJQueue"
  s.version      = "1.0.3"
  s.summary      = "This is a simple queue with Infinite or limit length and also dequeue periodic with timer for iOS platforms Edit Add topics"
  s.requires_arc = true
  #s.default_subspec = 'standard'
  # s.description  = <<-DESC

  s.homepage     = "https://github.com/Husseinhj/TimerHJQueue"
  s.license = 'MIT'

  s.author             = { "Hussein Habibi Juybari" => "hussein.juybari@gmail.com" }
  # Or just: s.author    = "Hussein Habibi Juybari"
  # s.authors            = { "Hussein Habibi Juybari" => "hussein.juybari@gmail.com" }
  # s.social_media_url   = "http://twitter.com/Hussein Habibi Juybari"

# s.pod_target_xcconfig = { 'SWIFT_VERSION' => '1.0' }
 s.source                = { :git => "https://github.com/Husseinhj/TimerHJQueue.git", :tag => "v#{s.version}" }
  s.source_files          = 'TimerHJQueue/TimerHJQueue.h'
  s.platform              = :ios
  s.ios.deployment_target = '6.0'

end

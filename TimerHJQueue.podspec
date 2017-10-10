Pod::Spec.new do |s|

  s.name         = "HJQueue"
  s.version      = "1.0.1"
  s.summary      = "This is a simple queue with Infinite or limit length and also dequeue periodic with timer for iOS platforms Edit Add topics"
  s.requires_arc = true
  s.default_subspec = 'standard'
  # s.description  = <<-DESC

  s.homepage     = "https://github.com/Husseinhj/TimerHJQueue"
  s.license = 'MIT'

  s.author             = { "Hussein Habibi Juybari" => "hussein.juybari@gmail.com" }
  # Or just: s.author    = "Hussein Habibi Juybari"
  # s.authors            = { "Hussein Habibi Juybari" => "hussein.juybari@gmail.com" }
  # s.social_media_url   = "http://twitter.com/Hussein Habibi Juybari"

# s.pod_target_xcconfig = { 'SWIFT_VERSION' => '1.0' }
 s.source                = { :git => "https://github.com/Husseinhj/TimerHJQueue.git", :tag => "v1.0.0" }
  s.source_files          = 'TimerHJQueue/HJQueue.h'
  s.platform              = :ios
  s.ios.deployment_target = '6.0'
  s.requires_arc          = true


end

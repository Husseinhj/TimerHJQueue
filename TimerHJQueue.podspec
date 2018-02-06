Pod::Spec.new do |s|
s.name         = 'TimerHJQueue'
s.version      = '1.0.3'
s.summary      = 'This is a simple queue with Infinite or limit length and also dequeue periodic with timer for iOS platforms.'
s.homepage     = 'https://github.com/Husseinhj/TimerHJQueue'
s.author       = { 'Hussein Habibi Juybari' => 'hussein.juybari@gmail.com' }
s.social_media_url   = "http://twitter.com/hussein_juybari"
s.source       = { :git => 'https://github.com/Husseinhj/TimerHJQueue.git', :tag => 'v#{s.version}' }
s.platform     = :ios, '6.0'
s.source_files = 'TimerHJQueue'
s.requires_arc = true
end

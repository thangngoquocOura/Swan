Pod::Spec.new do |s|
    s.name = 'Swan'
    s.version = '0.1.0'
    s.requires_arc = true
    s.platform = :ios, '8.0'
    s.ios.deployment_target = '8.0'
    s.source_files = 'Swan/Swan/*.swift'
    s.frameworks = 'SwanBridge'
    s.authors = { 'Antti Laitala' => 'antti.o.laitala@gmail.com' }
    s.license = { :type => 'MIT' }
    s.homepage = 'https://github.com/anlaital/Swan'
    s.source = { :git => 'https://github.com/anlaital/Swan.git' }
    s.summary = 'Swift development tools'
end

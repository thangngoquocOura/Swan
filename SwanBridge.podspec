Pod::Spec.new do |s|
    s.name = 'SwanBridge'
    s.version = '0.1.0'
    s.requires_arc = true
    s.platform = :ios, '8.0'
    s.ios.deployment_target = '8.0'
    s.header_dir = 'SwanBridge'
    s.source_files = 'SwanBridge/SwanBridge/*.{h,m}'
    s.authors = { 'Antti Laitala' => 'antti.o.laitala@gmail.com' }
    s.license = { :type => 'MIT' }
    s.homepage = 'https://github.com/anlaital/Swan'
    s.source = { :git => 'https://github.com/anlaital/Swan.git' }
    s.summary = 'Swift development tools'
end

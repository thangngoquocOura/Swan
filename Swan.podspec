Pod::Spec.new do |s|
    s.name = 'Swan'
    s.version = '0.1.0'
    s.requires_arc = true
    s.platform = :ios, '8.0'
    s.ios.deployment_target = '8.0'
    s.source_files = 'Swan/Swan/*.swift'
    s.frameworks = 'SwanBridge'
end

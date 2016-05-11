Pod::Spec.new do |s|
    s.name = 'Swan'
    s.version = '0.1.0'
    s.requires_arc = true
    s.platform = :ios, '8.0'
    s.ios.deployment_target = '8.0'
    s.source_files = 'Swan/Swan/*.swift'
    s.authors = { 'Antti Laitala' => 'antti.o.laitala@gmail.com' }
    s.license = { :type => 'MIT' }
    s.homepage = 'https://github.com/anlaital/Swan'
    s.source = { :git => 'https://github.com/anlaital/Swan.git' }
    s.summary = 'Swift development tools'

    s.preserve_paths = 'CommonCrypto/*'
    s.xcconfig = {
        'SWIFT_INCLUDE_PATHS[sdk=iphoneos*]' => '$(SRCROOT)/Swan/CommonCrypto/iphoneos',
        'SWIFT_INCLUDE_PATHS[sdk=iphonesimulator*]' => '$(SRCROOT)/Swan/CommonCrypto/iphonesimulator',
        'SWIFT_INCLUDE_PATHS[sdk=macosx*]' => '$(SRCROOT)/Swan/CommonCrypto/macosx'
    }
end

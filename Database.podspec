#
# Be sure to run `pod lib lint Database.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Database'
  s.version          = '1.0.0'
  s.summary          = '数据库'
  s.description      = <<-DESC
                        数据库封装
                       DESC

  s.homepage         = 'https://gitlab.hseduyun.net/mobile/database'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chaopeng' => 'rencp@vodjk.com' }
  s.source           = { :git => 'http://gitlab.hseduyun.net/mobile/database.git', :tag => s.version.to_s }

  s.swift_version = "5.0"
  s.ios.deployment_target = '11.0'

  s.source_files = 'Database/Classes/**/*'
  
  s.dependency 'RealmSwift'
  s.dependency 'ObjectMapper'

end

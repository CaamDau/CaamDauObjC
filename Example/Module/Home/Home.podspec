

Pod::Spec.new do |s|
  s.name             = 'Home'
  s.version          = '0.1.0'
  s.summary          = 'A short description of .'



  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/liucaide'
  
  #s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liucaide' => '565726319@qq.com' }
  s.source           = { :git => '' }
  

  s.ios.deployment_target = '9.0'

  s.source_files = 'Home/Classes/**/*'
  s.public_header_files = 'Home/Classes/R_Home.h'
  s.resource_bundles = {
    'Home' => ['Home/Nib/*.{xib,storyboard}']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'CaamDauObjC'
end

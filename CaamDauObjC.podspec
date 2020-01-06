
Pod::Spec.new do |s|
  s.name             = 'CaamDauObjC'
  s.version          = '0.1.0'
  s.summary          = 'A iOS development toolbox of Object-C (OC版iOS开发工具箱).'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/liucaide/CaamDauObjC'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liucaide' => '565726319@qq.com' }
  s.source           = { :git => 'https://github.com/liucaide/CaamDauObjC.git' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |core|
      # core.public_header_files = 'CaamDauObjC/CaamDauObjC.h'
      core.source_files = 'CaamDauObjC/CaamDauObjC.h', 'CaamDauObjC/Chain/*.{h,m}', 'CaamDauObjC/Categories/*.{h,m}', 'CaamDauObjC/Form/*.{h,m}'
      
  end
  
  s.subspec 'All' do |all|
      all.dependency 'CaamDauObjC/Core'
      all.dependency 'CaamDauObjC/MJRefresh'
      
  end
  
  # ---- 第三方 扩展 或 桥接
  s.subspec 'MJRefresh' do |mj|
      mj.source_files = 'CaamDauObjC/MJRefresh/*.{h,m}'
      # mj.public_header_files = 'CaamDauObjC/MJRefresh/CDMJRefresh.h'
      mj.dependency 'MJRefresh'
  end
  
  # s.resource_bundles = {
  #   'CaamDauObjC' => ['CaamDauObjC/Assets/*.png']
  # }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end


Pod::Spec.new do |s|
  s.name             = 'CD_ObjC'
  s.version          = '0.1.0'
  s.summary          = 'A iOS development toolbox of Object-C (OC版iOS开发工具箱).'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/liucaide/CD_ObjC'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liucaide' => '565726319@qq.com' }
  s.source           = { :git => 'https://github.com/liucaide/CD_ObjC.git' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |cd|
      cd.dependency 'CD_ObjC/Form'
      cd.dependency 'CD_ObjC/Chain'
  end
  
  s.subspec 'All' do |all|
      all.dependency 'CD_ObjC/Core'
      all.dependency 'CD_ObjC/MJRefresh'
      
  end
  
  s.subspec 'Form' do |fm|
      fm.source_files = 'CD_ObjC/CD_Form/*.{h,m}'
  end
  s.subspec 'Chain' do |cn|
      cn.source_files = 'CD_ObjC/CD_Chain/*.{h,m}'
  end
  # ---- 第三方 扩展 或 桥接
  s.subspec 'MJRefresh' do |mj|
      mj.source_files = 'CD_ObjC/CD_MJRefresh/*.{h,m}'
      mj.dependency 'MJRefresh'
  end
  
  # s.resource_bundles = {
  #   'CD_ObjC' => ['CD_ObjC/Assets/*.png']
  # }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end

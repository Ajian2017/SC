
Pod::Spec.new do |s|
  s.name             = 'LibSafeContainer'
  s.version          = '0.1.0'
  s.summary          = "the target of this project is to make  operatoring containers of iOS such as 'NSArray'、'NSDictionary'、'NSSet'  More Secure. ."

  s.homepage         = 'http://gitlab.tech.21cn.com/qinzj/SafeContainer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qinzj' => 'qzjian@gmail.com' }
  s.source       = { :git => "https://github.com/Ajian2017/SC.git", :tag => s.version }
  s.ios.deployment_target = '7.0'

  s.source_files = 'SafeContainer/*.{h,m}'
end

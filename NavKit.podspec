Pod::Spec.new do |s|
  s.name = 'NavKit'
  s.version = '0.5'
  s.license = 'MIT'
  s.summary = 'Simple and integrated way to customize navigation bar experience on iOS app.'
  s.homepage = 'https://github.com/wilbertliu/NavKit'
  s.social_media_url = 'https://twitter.com/wilbertliu'
  s.authors = { 'Wilbert Liu' => 'wilbertliu@gmail.com' }
  s.source = { :git => 'https://github.com/wilbertliu/NavKit.git', :tag => '0.5' }
  s.ios.deployment_target = '8.0'
  s.source_files = 'NavKit', 'NavKit/**/*.{h,m,swift}'
end

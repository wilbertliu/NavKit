Pod::Spec.new do |s|
  s.name = 'NavKit'
  s.version = '0.1'
  s.license = 'MIT'
  s.summary = 'Simple explicit declarative custom navigation for your project'
  s.homepage = 'https://github.com/wilbertliu/NavKit'
  s.social_media_url = 'https://twitter.com/wilbertliu'
  s.authors = { 'Wilbert Liu' => 'wilbertliu@gmail.com' }
  s.source = { :git => 'https://github.com/wilbertliu/NavKit.git', :tag => '0.1' }
  s.ios.deployment_target = '8.0'
  s.source_files = 'NavKit', 'NavKit/**/*.{h,m,swift}'
end

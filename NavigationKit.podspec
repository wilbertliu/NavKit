Pod::Spec.new do |s|
  s.name = 'NavigationKit'
  s.version = '0.2'
  s.license = 'MIT'
  s.summary = 'Simple explicit declarative custom navigation for your project'
  s.homepage = 'https://github.com/wilbertliu/NavigationKit'
  s.social_media_url = 'https://twitter.com/wilbertliu'
  s.authors = { 'Wilbert Liu' => 'wilbertliu@gmail.com' }
  s.source = { :git => 'https://github.com/wilbertliu/NavigationKit.git', :tag => '0.2' }
  s.ios.deployment_target = '8.0'
  s.source_files = 'NavigationKit', 'NavigationKit/**/*.{h,m,swift}'
end

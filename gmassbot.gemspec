Gem::Specification.new do |s|
    s.name        = 'gmassbot'
    s.version     = '1.1'
    s.date        = '2023-06-25'
    s.summary     = "Ruby library for automation operation on the GMass Deliverability Test and Spam Checker."
    s.description = "Find documentation here: https://github.com/leandrosardi/gmassbot"
    s.authors     = ["Leandro Daniel Sardi"]
    s.email       = 'leandro.sardi@expandedventure.com'
    s.files       = [
      'lib/gmassbot.rb',
    ]
    s.homepage    = 'https://rubygems.org/gems/gmassbot'
    s.license     = 'MIT'
    s.add_runtime_dependency 'blackstack-core', '~> 1.2.3', '>= 1.2.3'
    s.add_runtime_dependency 'simple_cloud_logging', '~> 1.2.2', '>= 1.2.2'
    s.add_runtime_dependency 'colorize', '~> 0.8.1', '>= 0.8.1'
    s.add_runtime_dependency 'selenium-webdriver', '~> 4.10.0', '>= 4.10.0'
    s.add_runtime_dependency 'test-unit', '~> 3.5.3', '>= 3.5.3'
    s.add_runtime_dependency 'pry', '~> 0.14.2', '>= 0.14.2'
end
# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name        = "aqua-io"
  gem.version     = "0.1.1"
  gem.description = "Official Aqua.io API library client for ruby. Covers API authentication and methods for ICD-9 and ICD-10 code endpoints."
  gem.summary     = "Official Aqua.io API library client for ruby (ICD-9 and ICD-10)."

  gem.author   = "Michael Carroll / Aqua.io"
  gem.email    = "michael@aqua.io"
  gem.homepage = "https://aqua.io"
  gem.license  = "MIT"

  gem.require_paths = ['lib']

  gem.files = Dir["lib/**/*"]

  gem.add_dependency 'faraday', '~> 0.9', '>= 0.9.0'
  gem.add_dependency 'json', '~> 1.7', '>= 1.7.7'
end

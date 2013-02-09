# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dota/version'

Gem::Specification.new do |gem|
  gem.name          = "dota"
  gem.version       = Dota::VERSION
  gem.authors       = ["Vasiliy Ermolovich"]
  gem.email         = ["younash@gmail.com"]
  gem.description   = %q{Ruby wrapper for Dota 2 WebAPI}
  gem.summary       = %q{Ruby wrapper for Dota 2 WebAPI}
  gem.homepage      = "https://github.com/nashby/dota"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'faraday', '~> 0.8.4'
  gem.add_dependency 'faraday_middleware', '~> 0.9.0'
  gem.add_development_dependency 'rake', '~> 10.0.3'
  gem.add_development_dependency 'minitest', '~> 4.5.0'
  gem.add_development_dependency 'webmock', '~> 1.9.0'
end

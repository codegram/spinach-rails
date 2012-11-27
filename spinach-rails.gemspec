# -*- encoding: utf-8 -*-
require File.expand_path('../lib/spinach-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Codegram"]
  gem.email         = ["info@codegram.com"]
  gem.description   = %q{spinach-rails adds Rails support to spinach}
  gem.summary       = %q{spinach-rails adds Rails support to spinach}
  gem.homepage      = 'http://github.com/codegram/spinach-rails'

  gem.add_runtime_dependency 'capybara', '~> 2.0.0'
  gem.add_runtime_dependency 'spinach', '>= 0.4'
  gem.add_runtime_dependency 'railties', '>= 3'
  gem.add_development_dependency 'aruba'
  gem.add_development_dependency 'rails'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "spinach-rails"
  gem.require_paths = ['lib']
  gem.version       = Spinach::Rails::VERSION
end

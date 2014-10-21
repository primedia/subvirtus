# -*- encoding: utf-8 -*-
require 'date'
require './lib/subvirtus/version'

Gem::Specification.new do |gem|
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'

  gem.authors       = ['David Cole', 'Tyler Boyd']
  gem.date          = Date.today.to_s
  gem.description   = 'Ruby attributes with type coercion.'
  gem.email         = ['dcole@rentpath.com', 'tboyd@rentpath.com']
  gem.files         = Dir.glob( '{ bin,lib }/**/*' ) + %w( README.md )
  gem.homepage      = 'http://github.com/primedia/subvirtus'
  gem.name          = 'subvirtus'
  gem.platform      = Gem::Platform::RUBY
  gem.require_paths = ['lib']
  gem.required_ruby_version = '>= 2.1.0'
  gem.summary       = 'Ruby attributes with type coercion.'
  gem.version       = Subvirtus::VERSION
end

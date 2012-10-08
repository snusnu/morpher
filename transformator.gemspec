# -*- encoding: utf-8 -*-

require File.expand_path('../lib/transformator/version.rb', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'transformator'
  gem.version     = Transformator::VERSION.dup
  gem.authors     = [ 'Markus Schirp' ]
  gem.email       = [ 'mbj@seonic.net' ]
  gem.description = 'Invertable transformations on data structures'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/mbj/transformator'

  gem.require_paths    = [ 'lib' ]
  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- spec`.split("\n")
  gem.extra_rdoc_files = %w[TODO]

  gem.add_runtime_dependency('ice_nine',            '~> 0.4.0')
  gem.add_runtime_dependency('descendants_tracker', '~> 0.0.1')
  gem.add_runtime_dependency('backports',           '~> 2.6')
  gem.add_runtime_dependency('immutable',           '~> 0.0.1')
  gem.add_runtime_dependency('equalizer',           '~> 0.0.1')
  gem.add_runtime_dependency('abstract_class',      '~> 0.0.1')
end

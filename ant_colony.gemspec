# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ant_colony/version'

Gem::Specification.new do |spec|
  spec.name          = 'ant_colony'
  spec.version       = AntColony::VERSION
  spec.authors       = %w(Alexandr Turchyn', 'Pete Matsyburka)
  spec.email         = %w(lexfox777@gmail.com', 'pete.matsy@gmail.com)
  spec.summary       = 'Ant colony optimization algorithms.'
  spec.description   = 'Simple implementation ant colony optimization algorithm.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'rspec', '~> 3.4.0'
  spec.add_development_dependency 'rubocop'

  spec.add_dependency 'bundler', '~> 1.7'
  spec.add_dependency 'rake', '~> 10.0'
  spec.add_dependency 'thor'
end

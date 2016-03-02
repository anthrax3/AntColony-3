# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ant_colony/version'

Gem::Specification.new do |spec|
  spec.name          = "ant_colony"
  spec.version       = AntColony::VERSION
  spec.authors       = ["Alexandr Turchyn"]
  spec.email         = ["lexfox777@gmail.com"]
  spec.summary       = %q{Ant colony optimization algorithms.}
  spec.description   = %q{Simple implementation ant colony optimization algorithm.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

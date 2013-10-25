# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'munna/version'

Gem::Specification.new do |spec|
  spec.name          = "munna"
  spec.version       = Munna::VERSION
  spec.authors       = ["MQuy\n"]
  spec.email         = ["sugiacupit@gmail.com"]
  spec.description   = %q{Optimize rails's expensive action with cache through Cache}
  spec.summary       = %q{Add cache for your object}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "rails"
end

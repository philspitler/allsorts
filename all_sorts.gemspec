# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'all_sorts/version'

Gem::Specification.new do |spec|
  spec.name          = "all_sorts"
  spec.version       = AllSorts::VERSION
  spec.authors       = ["Phil Spitler"]
  spec.email         = ["prs@sproutkey.com"]
  spec.summary     = 'A DSL for sorting results based on hash keys with the term _sort_ in them.'
  spec.description = ''
  spec.homepage    = 'https://github.com/philspitler/allsorts'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bond"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "factory_girl", "~> 4.0"
end


# -*- encoding: utf-8 -*-
require File.expand_path('../lib/all_sorts/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'all_sorts'
  gem.version     = AllSorts::VERSION
  gem.author      = "Phil Spitler"
  gem.email       = 'pspitler@gmail.com'
  gem.homepage    = 'https://github.com/philspitler/allsorts'
  gem.summary     = 'A DSL for sorting active record results based on hash keys with the term _sort_ in them.'
  gem.description = ''

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.require_paths = ['lib']

  gem.add_development_dependency 'maruku', '~> 0.6'
  gem.add_development_dependency 'rake', '~> 0.9'
  gem.add_development_dependency 'rspec', '~> 2.6'
  gem.add_development_dependency 'simplecov', '~> 0.4'
  gem.add_development_dependency 'yard', '~> 0.7'
  gem.add_development_dependency 'sqlite3'

  gem.add_dependency 'activerecord', '>= 3.0.1'
end

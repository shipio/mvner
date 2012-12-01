# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mvner/version'

Gem::Specification.new do |gem|
  gem.name          = "mvner"
  gem.version       = Mvner::VERSION
  gem.authors       = ["David Justice"]
  gem.email         = ["dave@cisimple.com"]
  gem.description   = %q{readin' maven poms 'ery day}
  gem.summary       = %q{gem is for reading maven project object models,
                         and specifically to assist in determining package structures for android maven projects.}
  gem.homepage      = "https://github.com/cisimple-team/mvner"

  gem.files         = `git ls-files`.split("\n").reject {|f| f=~/^(?:spec|examples)\//}
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = %w(lib)

  gem.add_dependency 'nokogiri'
  gem.add_dependency 'active_support'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end

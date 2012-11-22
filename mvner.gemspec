# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mvner/version'

Gem::Specification.new do |gem|
  gem.name          = "mvner"
  gem.version       = Mvner::VERSION
  gem.authors       = ["David Justice"]
  gem.email         = ["dave@cisimple.com"]
  gem.description   = %q{Ruby maven wrapper}
  gem.summary       = %q{Ruby wrapper for maven operations.}
  gem.homepage      = "https://github.com/cisimple-team/mvner"

  gem.files         = `git ls-files`.split("\n").reject {|f| f=~/^(?:spec|examples)\//}
  #gem.executables   = ["mvn"]
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'nokogiri'
  gem.add_dependency 'active_support'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end

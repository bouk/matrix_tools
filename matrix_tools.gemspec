# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matrix_tools/version'

Gem::Specification.new do |gem|
  gem.name          = "matrix_tools"
  gem.version       = MatrixTools::VERSION
  gem.authors       = ["Bouke van der Bijl"]
  gem.email         = ["boukevanderbijl@gmail.com"]
  gem.description   = %q{Provides useful utilities for Ruby matrices}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

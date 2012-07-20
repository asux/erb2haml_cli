# -*- encoding: utf-8 -*-
require File.expand_path('../lib/erb2haml_cli/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Oleksandr Ulianytskyi"]
  gem.email         = ["a.ulyanitsky@gmail.com"]
  gem.description   = %q{A simple script to convernt all erb files to haml under directory}
  gem.summary       = %q{A simple script to convernt all erb files to haml under directory}
  gem.homepage      = "https://github.com/asux/erb2haml_cli"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "erb2haml_cli"
  gem.require_paths = ["lib"]
  gem.version       = Erb2hamlCli::VERSION

  # Dependencies
  gem.add_dependency "hpricot", ">0"
  gem.add_dependency "erubis", ">0"
  gem.add_dependency "ruby_parser", ">0"
end

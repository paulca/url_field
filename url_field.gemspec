# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'url_field/version'

Gem::Specification.new do |spec|
  spec.name          = "url_field"
  spec.version       = UrlField::VERSION
  spec.authors       = ["Paul Campbell"]
  spec.email         = ["paul@rslw.com"]

  spec.summary       = %q{A simple ActiveRecord plugin to correctly format a URL in the database whether the user enters 'http://' or not}
  spec.homepage      = "http://github.com/paulca/url_field"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 2"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "sqlite3"
end

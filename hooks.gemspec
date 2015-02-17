# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hooks/version'

Gem::Specification.new do |spec|
  spec.name          = "hooks"
  spec.version       = Hooks::VERSION
  spec.authors       = ["delba"]
  spec.email         = ["delba@users.noreply.github.com"]

  spec.summary       = %q{A hooks library for ruby}
  spec.homepage      = "https://github.com/delba/hooks"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end

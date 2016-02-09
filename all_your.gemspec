# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'all_your/version'

Gem::Specification.new do |spec|
  spec.name          = 'all_your'
  spec.version       = AllYour::VERSION
  spec.authors       = ['Ben Pickles']
  spec.email         = ['spideryoung@gmail.com']
  spec.description   = %q{Encode and decode integers into strings, in a variety of interesting bases.}
  spec.summary       = %q{Encode and decode integers into strings, in a variety of interesting bases.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'minitest', '>= 5'
  spec.add_development_dependency 'rake'
end

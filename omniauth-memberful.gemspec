# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-memberful/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-memberful'
  spec.version       = Omniauth::Memberful::VERSION
  spec.authors       = ['Ross Kaffenberger']
  spec.email         = ['rosskaff@gmail.com']
  spec.summary       = %q{OmniAuth strategy for Memberful}
  spec.description   = %q{OmniAuth strategy for Memberful}
  spec.homepage      = 'https://github.com/rossta/memberful'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth-oauth2'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end

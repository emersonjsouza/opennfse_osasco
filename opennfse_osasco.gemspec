# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opennfse_osasco/version'

Gem::Specification.new do |spec|
  spec.name          = "opennfse_osasco"
  spec.version       = OpennfseOsasco::VERSION
  spec.authors       = ["Emerson Jose"]
  spec.email         = ["emersonjprogramador@gmail.com"]

  spec.summary       = %q{Gerador de nfse via API com sistema de NFS-e da prefeitura de Osasco}
  spec.description   = %q{Gem para comunicação via API com o sistema de NFS-e da prefeitura de Osasco}
  spec.homepage      = "https://github.com/emersonjsouza/opennfse_osasco"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "savon", "~> 2.11.0"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

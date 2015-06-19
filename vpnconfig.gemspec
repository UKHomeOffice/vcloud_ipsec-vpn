# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vpnconfig/version'

Gem::Specification.new do |spec|
  spec.name          = "vpnconfig"
  spec.version       = Vpnconfig::VERSION
  spec.authors       = ["Tim Gent"]
  spec.email         = ["tim.gent@gmail.com"]

  spec.summary       = "A command line tool to allow use of a yaml VPN configuration file to push this config to Skyscape"
  spec.description   = ""
  spec.homepage      = "https://github.com/UKHomeOffice/vcloud_ipec-vpn"
  spec.license       = "apache"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('test-unit')
  spec.add_dependency('methadone', '~> 1.9.1')
  spec.add_dependency('nokogiri', '~> 1.6.6.2')
  spec.add_dependency('diffy', '~> 3.0.7')
  spec.add_dependency('kwalify', '~> 0.7.2')
end

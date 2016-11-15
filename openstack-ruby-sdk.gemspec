# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'openstack-ruby-sdk/version'

Gem::Specification.new do |s|
  s.name          = "openstack-ruby-sdk"
  s.version       = OpenStackRubySDK::VERSION
  s.authors       = ["Matt Darby"]
  s.email         = ["matt.darby@rackspace.com"]

  s.summary       = "OpenStack Ruby SDK"
  s.description   = "OpenStack Ruby SDK"
  s.homepage      = "http://github.com/rackerlabs/openstack-ruby-sdk"
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|s|features)/}) }
  s.bindir        = "bin"
  s.executables   = []
  s.require_paths = ["lib"]

  s.add_dependency "thor"
  s.add_dependency "activesupport"
  s.add_dependency "activemodel"
  s.add_dependency "rest-client"

  s.add_development_dependency "awesome_print"
  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "pry"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec-core"
  s.add_development_dependency "rspec-expectations"
  s.add_development_dependency "rspec-mocks"
  s.add_development_dependency "sinatra"
  s.add_development_dependency "thin"
end

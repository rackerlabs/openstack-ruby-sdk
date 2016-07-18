require "openstack-ruby-sdk/version"
require 'rackspace-ruby-sdk-core'
require 'pry'

module OpenStackRubySDK
end

SERVICE_NAME_MAP = {
  "barbican"   => "barbican", # Double check
  "ceilometer" => "ceilometer",
  "cinder"     => "cinder",
  "designate"  => "designate", # Double check
  "glance"     => "glance",
  "gnocchi"    => "gnocchi", # Double check
  "heat"       => "heat",
  "keystone"   => "keystone",
  "marconi"    => "marconi", # Double check
  "neutron"    => "neutron",
  "nova"       => "nova",
  "poppy"      => "poppy", # Double check
  "raksha"     => "raksha", # Double check
  "savanna"    => "savanna", # Double check
  "swift"      => "swift",
  "trove"      => "trove" # Double check
}

SERVICE_KLASSES = {
  "barbican"   => "OpenStackRubySDK::Barbican", # Double check
  "ceilometer" => "OpenStackRubySDK::Ceilometer",
  "cinder"     => "OpenStackRubySDK::Cinder",
  "designate"  => "OpenStackRubySDK::Designate", # Double check
  "glance"     => "OpenStackRubySDK::Glance",
  "gnocchi"    => "OpenStackRubySDK::Gnocchi", # Double check
  "heat"       => "OpenStackRubySDK::Heat",
  "keystone"   => "OpenStackRubySDK::Keystone",
  "marconi"    => "OpenStackRubySDK::Marconi", # Double check
  "neutron"    => "OpenStackRubySDK::Neutron",
  "nova"       => "OpenStackRubySDK::Nova",
  "poppy"      => "OpenStackRubySDK::Poppy", # Double check
  "raksha"     => "OpenStackRubySDK::Raksha", # Double check
  "savanna"    => "OpenStackRubySDK::Savanna", # Double check
  "swift"      => "OpenStackRubySDK::Swift",
  "trove"      => "OpenStackRubySDK::Trove" # Double check
}

Dir[File.expand_path "lib/openstack-ruby-sdk/services/**/base.rb"].each{ |f| require_relative f }
Dir[File.expand_path "lib/openstack-ruby-sdk/services/**/*.rb"].each{ |f| require_relative f }

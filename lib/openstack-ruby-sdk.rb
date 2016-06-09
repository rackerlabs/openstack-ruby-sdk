require "openstack-ruby-sdk/version"
require 'rackspace-ruby-sdk-core'
require 'pry'

module OpenStackRubySDK
end

SERVICE_NAME_MAP = {
  "nova"       => "nova",
  "neutron"    => "neutron",
  "cinderv2"   => "cinderv2",
  "aodh"       => "aodh",
  "glance"     => "glance",
  "ceilometer" => "ceilometer",
  "heat"       => "heat",
  "swift"      => "swift",
  "keystone"   => "keystone"
}

SERVICE_KLASSES = {
  "nova"       => "OpenStackRubySDK::Nova",
  "neutron"    => "OpenStackRubySDK::Neutron",
  "cinderv2"   => "OpenStackRubySDK::CinderV2",
  "aodh"       => "OpenStackRubySDK::Aodh",
  "glance"     => "OpenStackRubySDK::Glance",
  "ceilometer" => "OpenStackRubySDK::Ceilometer",
  "heat"       => "OpenStackRubySDK::Heat",
  "swift"      => "OpenStackRubySDK::Swift",
  "keystone"   => "OpenStackRubySDK::Keystone"
}

Dir[File.expand_path "lib/openstack-ruby-sdk/services/**/base.rb"].each{ |f| require_relative f }
Dir[File.expand_path "lib/openstack-ruby-sdk/services/**/*.rb"].each{ |f| require_relative f }

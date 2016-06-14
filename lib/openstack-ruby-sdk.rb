require "openstack-ruby-sdk/version"
require 'rackspace-ruby-sdk-core'
require 'pry'

module OpenStackRubySDK
end

SERVICE_NAME_MAP = {
  "ceilometer" => "ceilometer",
  "cinderv2"   => "cinderv2",
  "glance"     => "glance",
  "heat"       => "heat",
  "keystone"   => "keystone",
  "neutron"    => "neutron",
  "nova"       => "nova",
  "swift"      => "swift"
}

SERVICE_KLASSES = {
  "ceilometer" => "OpenStackRubySDK::Ceilometer",
  "cinderv2"   => "OpenStackRubySDK::CinderV2",
  "glance"     => "OpenStackRubySDK::Glance",
  "heat"       => "OpenStackRubySDK::Heat",
  "keystone"   => "OpenStackRubySDK::Keystone",
  "neutron"    => "OpenStackRubySDK::Neutron",
  "nova"       => "OpenStackRubySDK::Nova",
  "swift"      => "OpenStackRubySDK::Swift"
}

Dir[File.expand_path "lib/openstack-ruby-sdk/services/**/base.rb"].each{ |f| require_relative f }
Dir[File.expand_path "lib/openstack-ruby-sdk/services/**/*.rb"].each{ |f| require_relative f }

require "openstack-ruby-sdk/version"
require 'rackspace-ruby-sdk-core'
require 'pry'

module OpenStackRubySDK
end

Dir[File.expand_path "lib/openstack-ruby-sdk/services/**/base.rb"].each{ |f| require_relative f }

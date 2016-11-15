$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'openstack-ruby-sdk'

FLAVOR_ID  = '1'
IMAGE_ID   = ''
PROJECT_ID = ''

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def fresh_server
    server = OpenStackRubySDK::Nova::Server.create({
      name: Time.now.usec.to_s,
      flavorRef: FLAVOR_ID,
      imageRef: IMAGE_ID })
    Core::Helpers.wait_for(server)
  end

  def fresh_volume
    volume = OpenStackRubySDK::Cinder::Volume.create({
      size: '1',
      name: Time.now.usec.to_s })
    Core::Helpers.wait_for(volume, "available")
  end

  def server_with_volume
    v = fresh_volume
    s = fresh_server
    s.attach_volume(v.id)
    Core::Helpers.wait_for(v, "in-use")
    Core::Helpers.wait_for(s)
  end

end

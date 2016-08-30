$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'openstack-ruby-sdk'
require 'vcr'

ENV['SDK']='openstack'

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

  vcr_filters = %w{OS_AUTH_URL OS_USERNAME OS_PASSWORD OS_TENANT_NAME}
  vcr_filters.each{ |env_var| raise "MISSING VCR SENSITIVE DATA ENV VAR: #{env_var}" unless ENV[env_var] }

  VCR.configure do |c|
    c.cassette_library_dir = "spec/vcr"
    c.hook_into :webmock
    c.configure_rspec_metadata!
    c.default_cassette_options = { record: :once }
    c.filter_sensitive_data('<OS_AUTH_URL>') { ENV['OS_AUTH_URL'] }
    c.filter_sensitive_data('<OS_USERNAME>') { ENV['OS_USERNAME'] }
    c.filter_sensitive_data('<OS_PASSWORD>') { ENV['OS_PASSWORD'] }
    c.filter_sensitive_data('<OS_TENANT_NAME>') { ENV['OS_TENANT_NAME'] }
  end

  def vcr_on
    VCR.turn_on!
    WebMock.disable_net_connect!
  end

  def vcr_off
    VCR.turn_off!
    WebMock.allow_net_connect!
  end

  def do_it_live
    File.delete(VCR.current_cassette.file) unless recording?
  end

  def recording?
    VCR.current_cassette.recording?
  end

  def fast_forward(n)
    sleep n if recording?
  end

  def fresh_server
    server = OpenStackRubySDK::Nova::Server.create({
      name: Time.now.usec.to_s,
      flavorRef: FLAVOR_ID,
      imageRef: IMAGE_ID })
    Peace::Helpers.wait_for(server)
  end

  def fresh_volume
    volume = OpenStackRubySDK::Cinder::Volume.create({
      size: '1',
      name: Time.now.usec.to_s })
    Peace::Helpers.wait_for(volume, "available")
  end

  def server_with_volume
    v = fresh_volume
    s = fresh_server
    s.attach_volume(v.id)
    Peace::Helpers.wait_for(v, "in-use")
    Peace::Helpers.wait_for(s)
  end

end

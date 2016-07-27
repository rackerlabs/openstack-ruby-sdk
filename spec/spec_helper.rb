$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'openstack-ruby-sdk'
require 'vcr'

ENV['SDK']='openstack'

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

    # c.debug_logger = STDOUT
    #
    # c.register_request_matcher :uri do |x, y|
    #   puts "---"
    #   puts "#{x.uri}\n#{y.uri}"
    #   x.uri == y.uri
    # end

    c.filter_sensitive_data('<OS_AUTH_URL>') { ENV['OS_AUTH_URL'] }
    c.filter_sensitive_data('<OS_USERNAME>') { ENV['OS_USERNAME'] }
    c.filter_sensitive_data('<OS_PASSWORD>') { ENV['OS_PASSWORD'] }
    c.filter_sensitive_data('<OS_TENANT_NAME>') { ENV['OS_TENANT_NAME'] }
  end

  config.after(:all) do
    VCR.use_cassette('cleanup') do
      OpenStackRubySDK::Nova::Server.all.each{ |s| s.destroy rescue next }
      OpenStackRubySDK::Cinder::Volume.all.each{ |s| s.destroy rescue next }
    end
  end
end

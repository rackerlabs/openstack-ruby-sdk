require 'spec_helper'

describe OpenStackRubySDK do
  it 'has a version number' do
    expect(OpenStackRubySDK::VERSION).not_to be nil
  end

  it 'knows what services are available' do
    expect(Peace.service_catalog.available_services.size).to be > 0
  end

end

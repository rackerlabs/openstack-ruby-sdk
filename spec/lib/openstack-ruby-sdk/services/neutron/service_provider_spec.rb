require 'spec_helper'

describe OpenStackRubySDK::Neutron::ServiceProvider, :vcr do
  let(:service_provider){ OpenStackRubySDK::Neutron::ServiceProvider.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Neutron::ServiceProvider.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Neutron::ServiceProvider.find(service_provider.id)).to eq(service_provider)
  end

  it 'creates its self' do
    service_provider.name = Time.now.usec.to_s
    expect(service_provider.save).to eq(true)
  end

  it 'updates its self' do
    service_provider.name = Time.now.usec.to_s
    expect(service_provider.save).to eq(true)
    service_provider.name = Time.now.usec.to_s
    expect(service_provider.save).to eq(true)
  end

  it 'deletes its self' do
    expect(service_provider.destroy).to eq(true)
  end
end

require 'spec_helper'

describe OpenStackRubySDK::Neutron::Network, :vcr do
  let(:network){ OpenStackRubySDK::Neutron::Network.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Neutron::Network.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Neutron::Network.find(network.id)).to eq(network)
  end

  it 'creates its self' do
    network.name = Time.now.usec.to_s
    expect(network.save).to eq(true)
  end

  it 'updates its self' do
    network.name = Time.now.usec.to_s
    expect(network.save).to eq(true)
    network.name = Time.now.usec.to_s
    expect(network.save).to eq(true)
  end

  it 'deletes its self' do
    expect(network.destroy).to eq(true)
  end
end

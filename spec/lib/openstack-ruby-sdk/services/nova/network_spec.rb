require 'spec_helper'

describe OpenStackRubySDK::Nova::Network, :vcr do
  let(:network){ OpenStackRubySDK::Nova::Network.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::Network.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Nova::Network.find(network.id)).to eq(network)
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

require 'spec_helper'

describe OpenStackRubySDK::Neutron::Network do
  let(:network) do
    OpenStackRubySDK::Neutron::Network.create({ name: "testing" })
  end

  it 'gets an index' do
    expect(OpenStackRubySDK::Neutron::Network.all.count).to be >= 0
  end

  it 'gets its self' do
    n = OpenStackRubySDK::Neutron::Network.find(network.id)
    expect(n.id).to eq(network.id)
  end

  it 'creates its self' do
    expect(network).to be_present
  end

  it 'updates its self' do
    name = "something wacky"
    network.name = name
    network.save
    network.reload
    expect(network.name).to eq(name)
  end

  it 'deletes its self' do
    expect(network.destroy).to eq(true)
  end
end

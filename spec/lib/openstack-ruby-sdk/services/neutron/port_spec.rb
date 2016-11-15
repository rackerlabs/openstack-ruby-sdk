require 'spec_helper'

describe OpenStackRubySDK::Neutron::Port do
  let(:network) do
    OpenStackRubySDK::Neutron::Network.create({ name: "testing" })
  end

  let(:port) do
    OpenStackRubySDK::Neutron::Port.create({
      network_id: network.id,
      name: "testing",
      admin_state_up: true
    })
  end

  it 'gets an index' do
    expect(OpenStackRubySDK::Neutron::Port.all.count).to be >= 0
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Neutron::Port.find(port.id).id).to eq(port.id)
  end

  it 'creates its self' do
    expect(port).to be_present
  end

  it 'updates its self' do
    name = "something wacky"
    port.name = name
    port.save
    port.reload
    expect(port.name).to eq(name)
  end

  it 'deletes its self' do
    expect(port.destroy).to eq(true)
  end
end

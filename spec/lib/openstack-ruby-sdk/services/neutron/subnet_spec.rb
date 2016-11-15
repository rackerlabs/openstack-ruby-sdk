require 'spec_helper'

describe OpenStackRubySDK::Neutron::Subnet do
  let(:network) do
    OpenStackRubySDK::Neutron::Network.create({ name: "testing" })
  end

  let(:subnet) do
    OpenStackRubySDK::Neutron::Subnet.create({
      network_id: network.id,
      ip_version: 4,
      cidr: "10.0.0.1/8"
    })
  end

  it 'gets an index' do
    expect(OpenStackRubySDK::Neutron::Subnet.all.count).to be >= 0
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Neutron::Subnet.find(subnet.id).id).to eq(subnet.id)
  end

  it 'creates its self' do
    expect(subnet).to be_present
  end

  it 'updates its self' do
    name = "something wacky"
    subnet.name = name
    subnet.save
    subnet.reload
    expect(subnet.name).to eq(name)
  end

  it 'deletes its self' do
    expect(subnet.destroy).to eq(true)
  end
end

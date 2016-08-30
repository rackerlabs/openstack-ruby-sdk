require 'spec_helper'

describe OpenStackRubySDK::Neutron::LoadBalancer, :vcr do
  let(:network) do
    OpenStackRubySDK::Neutron::Network.create({
      name: "testing"
    })
  end

  let(:subnet) do
    OpenStackRubySDK::Neutron::Subnet.create({
      network_id: network.id,
      ip_version: 4,
      cidr: "10.0.0.1/8"
    })
  end

  let(:lb) do
    OpenStackRubySDK::Neutron::LoadBalancer.create({
      admin_state_up: true,
      description: "testing",
      name: "testing",
      vip_address: "10.0.0.4",
      vip_subnet_id: subnet.id
    })
  end

  it 'gets an index' do
    expect(OpenStackRubySDK::Neutron::LoadBalancer.all.count).to be >= 0
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Neutron::LoadBalancer.find(lb.id).id).to eq(lb.id)
  end

  it 'creates its self' do
    expect(lb).to be_present
  end

  it 'updates its self' do
    name = "something wacky"
    lb.name = name
    lb.save
    lb.reload
    expect(lb.name).to eq(name)
  end

  it 'deletes its self' do
    expect(lb.destroy).to eq(true)
  end
end

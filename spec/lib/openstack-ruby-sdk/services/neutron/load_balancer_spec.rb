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
      cidr: "10.0.0.1"
    })
  end

  let(:lb) do
    OpenStackRubySDK::Neutron::LoadBalancer.create({
      admin_state_up: "",
      description: "",
      listeners: "",
      name: "",
      operating_status: "",
      provisioning_status: "",
      vip_address: "",
      vip_subnet_id: ""
    })
  end

  it 'gets an index' do
    expect(OpenStackRubySDK::Neutron::LoadBalancer.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Neutron::LoadBalancer.find(lb.id)).to eq(lb)
  end

  it 'creates its self' do
    lb.name = Time.now.usec.to_s
    expect(lb.save).to eq(true)
  end

  it 'updates its self' do
    lb.name = Time.now.usec.to_s
    expect(lb.save).to eq(true)
    lb.name = Time.now.usec.to_s
    expect(lb.save).to eq(true)
  end

  it 'deletes its self' do
    expect(lb.destroy).to eq(true)
  end
end

require 'spec_helper'

describe OpenStackRubySDK::Neutron::Subnet, :vcr do
  let(:subnet){ OpenStackRubySDK::Neutron::Subnet.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Neutron::Subnet.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Neutron::Subnet.find(subnet.id)).to eq(subnet)
  end

  it 'creates its self' do
    subnet.name = Time.now.usec.to_s
    expect(subnet.save).to eq(true)
  end

  it 'updates its self' do
    subnet.name = Time.now.usec.to_s
    expect(subnet.save).to eq(true)
    subnet.name = Time.now.usec.to_s
    expect(subnet.save).to eq(true)
  end

  it 'deletes its self' do
    expect(subnet.destroy).to eq(true)
  end
end

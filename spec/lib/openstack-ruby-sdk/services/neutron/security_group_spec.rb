require 'spec_helper'

describe OpenStackRubySDK::Neutron::SecurityGroup, :vcr do
  let(:security_group){ OpenStackRubySDK::Neutron::SecurityGroup.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Neutron::SecurityGroup.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Neutron::SecurityGroup.find(security_group.id)).to eq(security_group)
  end

  it 'creates its self' do
    security_group.name = Time.now.usec.to_s
    expect(security_group.save).to eq(true)
  end

  it 'updates its self' do
    security_group.name = Time.now.usec.to_s
    expect(security_group.save).to eq(true)
    security_group.name = Time.now.usec.to_s
    expect(security_group.save).to eq(true)
  end

  it 'deletes its self' do
    expect(security_group.destroy).to eq(true)
  end
end

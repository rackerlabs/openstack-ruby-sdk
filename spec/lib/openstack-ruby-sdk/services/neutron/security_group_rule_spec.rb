require 'spec_helper'

describe OpenStackRubySDK::Neutron::SecurityGroupRule do
  let(:security_group_rule){ OpenStackRubySDK::Neutron::SecurityGroupRule.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Neutron::SecurityGroupRule.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Neutron::SecurityGroupRule.find(security_group_rule.id)).to eq(security_group_rule)
  end

  it 'creates its self' do
    security_group_rule.name = Time.now.usec.to_s
    expect(security_group_rule.save).to eq(true)
  end

  it 'updates its self' do
    security_group_rule.name = Time.now.usec.to_s
    expect(security_group_rule.save).to eq(true)
    security_group_rule.name = Time.now.usec.to_s
    expect(security_group_rule.save).to eq(true)
  end

  it 'deletes its self' do
    expect(security_group_rule.destroy).to eq(true)
  end
end

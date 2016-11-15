require 'spec_helper'

describe OpenStackRubySDK::Keystone::Policy do
  let(:policy){ OpenStackRubySDK::Keystone::Policy.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Keystone::Policy.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Keystone::Policy.find(policy.id)).to eq(policy)
  end

  it 'creates its self' do
    policy.name = Time.now.usec.to_s
    expect(policy.save).to eq(true)
  end

  it 'updates its self' do
    policy.name = Time.now.usec.to_s
    expect(policy.save).to eq(true)
    policy.name = Time.now.usec.to_s
    expect(policy.save).to eq(true)
  end

  it 'deletes its self' do
    expect(policy.destroy).to eq(true)
  end
end

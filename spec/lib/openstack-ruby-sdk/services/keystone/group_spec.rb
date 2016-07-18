require 'spec_helper'

describe OpenStackRubySDK::Keystone::Group, :vcr do
  let(:group){ OpenStackRubySDK::Keystone::Group.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Keystone::Group.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Keystone::Group.find(group.id)).to eq(group)
  end

  it 'creates its self' do
    group.name = Time.now.usec.to_s
    expect(group.save).to eq(true)
  end

  it 'updates its self' do
    group.name = Time.now.usec.to_s
    expect(group.save).to eq(true)
    group.name = Time.now.usec.to_s
    expect(group.save).to eq(true)
  end

  it 'deletes its self' do
    expect(group.destroy).to eq(true)
  end
end

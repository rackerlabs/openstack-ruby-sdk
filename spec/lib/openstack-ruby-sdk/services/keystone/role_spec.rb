require 'spec_helper'

describe OpenStackRubySDK::Keystone::Role, :vcr do
  let(:role){ OpenStackRubySDK::Keystone::Role.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Keystone::Role.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Keystone::Role.find(role.id)).to eq(role)
  end

  it 'creates its self' do
    role.name = Time.now.usec.to_s
    expect(role.save).to eq(true)
  end

  it 'updates its self' do
    role.name = Time.now.usec.to_s
    expect(role.save).to eq(true)
    role.name = Time.now.usec.to_s
    expect(role.save).to eq(true)
  end

  it 'deletes its self' do
    expect(role.destroy).to eq(true)
  end
end

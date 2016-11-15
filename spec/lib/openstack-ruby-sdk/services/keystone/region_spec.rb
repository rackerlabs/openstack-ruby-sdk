require 'spec_helper'

describe OpenStackRubySDK::Keystone::Region do
  let(:region){ OpenStackRubySDK::Keystone::Region.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Keystone::Region.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Keystone::Region.find(region.id)).to eq(region)
  end

  it 'creates its self' do
    region.name = Time.now.usec.to_s
    expect(region.save).to eq(true)
  end

  it 'updates its self' do
    region.name = Time.now.usec.to_s
    expect(region.save).to eq(true)
    region.name = Time.now.usec.to_s
    expect(region.save).to eq(true)
  end

  it 'deletes its self' do
    expect(region.destroy).to eq(true)
  end
end

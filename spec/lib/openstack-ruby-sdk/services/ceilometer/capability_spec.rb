require 'spec_helper'

describe OpenStackRubySDK::Ceilometer::Capability do
  let(:capability){ OpenStackRubySDK::Ceilometer::Capability.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Ceilometer::Capability.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Ceilometer::Capability.find(capability.id)).to eq(capability)
  end

  it 'creates its self' do
    capability.name = Time.now.usec.to_s
    expect(capability.save).to eq(true)
  end

  it 'updates its self' do
    capability.name = Time.now.usec.to_s
    expect(capability.save).to eq(true)
    capability.name = Time.now.usec.to_s
    expect(capability.save).to eq(true)
  end

  it 'deletes its self' do
    expect(capability.destroy).to eq(true)
  end
end

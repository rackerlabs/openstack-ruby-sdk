require 'spec_helper'

describe OpenStackRubySDK::Ceilometer::Resource, :vcr do
  let(:resource){ OpenStackRubySDK::Ceilometer::Resource.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Ceilometer::Resource.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Ceilometer::Resource.find(resource.id)).to eq(resource)
  end

  it 'creates its self' do
    resource.name = Time.now.usec.to_s
    expect(resource.save).to eq(true)
  end

  it 'updates its self' do
    resource.name = Time.now.usec.to_s
    expect(resource.save).to eq(true)
    resource.name = Time.now.usec.to_s
    expect(resource.save).to eq(true)
  end

  it 'deletes its self' do
    expect(resource.destroy).to eq(true)
  end
end

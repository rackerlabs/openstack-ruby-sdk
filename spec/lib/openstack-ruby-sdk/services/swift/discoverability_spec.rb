require 'spec_helper'

describe OpenStackRubySDK::Swift::Discoverability, :vcr do
  let(:discoverability){ OpenStackRubySDK::Swift::Discoverability.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Swift::Discoverability.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Swift::Discoverability.find(discoverability.id)).to eq(discoverability)
  end

  it 'creates its self' do
    discoverability.name = Time.now.usec.to_s
    expect(discoverability.save).to eq(true)
  end

  it 'updates its self' do
    discoverability.name = Time.now.usec.to_s
    expect(discoverability.save).to eq(true)
    discoverability.name = Time.now.usec.to_s
    expect(discoverability.save).to eq(true)
  end

  it 'deletes its self' do
    expect(discoverability.destroy).to eq(true)
  end
end

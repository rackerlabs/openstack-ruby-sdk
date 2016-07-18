require 'spec_helper'

describe OpenStackRubySDK::Trove::HighAvailability, :vcr do
  let(:high_availability){ OpenStackRubySDK::Trove::HighAvailability.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Trove::HighAvailability.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Trove::HighAvailability.find(high_availability.id)).to eq(high_availability)
  end

  it 'creates its self' do
    high_availability.name = Time.now.usec.to_s
    expect(high_availability.save).to eq(true)
  end

  it 'updates its self' do
    high_availability.name = Time.now.usec.to_s
    expect(high_availability.save).to eq(true)
    high_availability.name = Time.now.usec.to_s
    expect(high_availability.save).to eq(true)
  end

  it 'deletes its self' do
    expect(high_availability.destroy).to eq(true)
  end
end

require 'spec_helper'

describe OpenStackRubySDK::Ceilometer::Meter do
  let(:meter){ OpenStackRubySDK::Ceilometer::Meter.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Ceilometer::Meter.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Ceilometer::Meter.find(meter.id)).to eq(meter)
  end

  it 'creates its self' do
    meter.name = Time.now.usec.to_s
    expect(meter.save).to eq(true)
  end

  it 'updates its self' do
    meter.name = Time.now.usec.to_s
    expect(meter.save).to eq(true)
    meter.name = Time.now.usec.to_s
    expect(meter.save).to eq(true)
  end

  it 'deletes its self' do
    expect(meter.destroy).to eq(true)
  end
end

require 'spec_helper'

describe OpenStackRubySDK::Ceilometer::Event, :vcr do
  let(:event){ OpenStackRubySDK::Ceilometer::Event.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Ceilometer::Event.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Ceilometer::Event.find(event.id)).to eq(event)
  end

  it 'creates its self' do
    event.name = Time.now.usec.to_s
    expect(event.save).to eq(true)
  end

  it 'updates its self' do
    event.name = Time.now.usec.to_s
    expect(event.save).to eq(true)
    event.name = Time.now.usec.to_s
    expect(event.save).to eq(true)
  end

  it 'deletes its self' do
    expect(event.destroy).to eq(true)
  end
end

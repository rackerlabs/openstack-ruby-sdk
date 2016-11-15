require 'spec_helper'

describe OpenStackRubySDK::Ceilometer::EventType do
  let(:event_type){ OpenStackRubySDK::Ceilometer::EventType.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Ceilometer::EventType.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Ceilometer::EventType.find(event_type.id)).to eq(event_type)
  end

  it 'creates its self' do
    event_type.name = Time.now.usec.to_s
    expect(event_type.save).to eq(true)
  end

  it 'updates its self' do
    event_type.name = Time.now.usec.to_s
    expect(event_type.save).to eq(true)
    event_type.name = Time.now.usec.to_s
    expect(event_type.save).to eq(true)
  end

  it 'deletes its self' do
    expect(event_type.destroy).to eq(true)
  end
end

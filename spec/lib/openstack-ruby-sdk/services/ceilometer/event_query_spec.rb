require 'spec_helper'

describe OpenStackRubySDK::Ceilometer::EventQuery do
  let(:event_query){ OpenStackRubySDK::Ceilometer::EventQuery.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Ceilometer::EventQuery.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Ceilometer::EventQuery.find(event_query.id)).to eq(event_query)
  end

  it 'creates its self' do
    event_query.name = Time.now.usec.to_s
    expect(event_query.save).to eq(true)
  end

  it 'updates its self' do
    event_query.name = Time.now.usec.to_s
    expect(event_query.save).to eq(true)
    event_query.name = Time.now.usec.to_s
    expect(event_query.save).to eq(true)
  end

  it 'deletes its self' do
    expect(event_query.destroy).to eq(true)
  end
end

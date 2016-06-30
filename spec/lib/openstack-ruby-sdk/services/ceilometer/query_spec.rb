require 'spec_helper'

describe OpenStackRubySDK::Ceilometer::Query, :vcr do
  let(:query){ OpenStackRubySDK::Ceilometer::Query.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Ceilometer::Query.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Ceilometer::Query.find(query.id)).to eq(query)
  end

  it 'creates its self' do
    query.name = Time.now.usec.to_s
    expect(query.save).to eq(true)
  end

  it 'updates its self' do
    query.name = Time.now.usec.to_s
    expect(query.save).to eq(true)
    query.name = Time.now.usec.to_s
    expect(query.save).to eq(true)
  end

  it 'deletes its self' do
    expect(query.destroy).to eq(true)
  end
end

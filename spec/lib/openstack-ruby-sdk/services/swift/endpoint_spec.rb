require 'spec_helper'

describe OpenStackRubySDK::Swift::Endpoint, :vcr do
  let(:endpoint){ OpenStackRubySDK::Swift::Endpoint.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Swift::Endpoint.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Swift::Endpoint.find(endpoint.id)).to eq(endpoint)
  end

  it 'creates its self' do
    endpoint.name = Time.now.usec.to_s
    expect(endpoint.save).to eq(true)
  end

  it 'updates its self' do
    endpoint.name = Time.now.usec.to_s
    expect(endpoint.save).to eq(true)
    endpoint.name = Time.now.usec.to_s
    expect(endpoint.save).to eq(true)
  end

  it 'deletes its self' do
    expect(endpoint.destroy).to eq(true)
  end
end

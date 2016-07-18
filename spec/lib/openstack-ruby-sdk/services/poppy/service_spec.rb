require 'spec_helper'

describe OpenStackRubySDK::Poppy::Service, :vcr do
  let(:service){ OpenStackRubySDK::Poppy::Service.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Poppy::Service.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Poppy::Service.find(service.id)).to eq(service)
  end

  it 'creates its self' do
    service.name = Time.now.usec.to_s
    expect(service.save).to eq(true)
  end

  it 'updates its self' do
    service.name = Time.now.usec.to_s
    expect(service.save).to eq(true)
    service.name = Time.now.usec.to_s
    expect(service.save).to eq(true)
  end

  it 'deletes its self' do
    expect(service.destroy).to eq(true)
  end
end

require 'spec_helper'

describe OpenStackRubySDK::Nova::Server, :vcr do
  let(:server){ OpenStackRubySDK::Nova::Server.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::Server.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Nova::Server.find(server.id)).to eq(server)
  end

  it 'creates its self' do
    server.name = Time.now.usec.to_s
    expect(server.save).to eq(true)
  end

  it 'updates its self' do
    server.name = Time.now.usec.to_s
    expect(server.save).to eq(true)
    server.name = Time.now.usec.to_s
    expect(server.save).to eq(true)
  end

  it 'deletes its self' do
    expect(server.destroy).to eq(true)
  end
end

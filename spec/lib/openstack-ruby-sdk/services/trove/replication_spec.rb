require 'spec_helper'

describe OpenStackRubySDK::Trove::Replication, :vcr do
  let(:replication){ OpenStackRubySDK::Trove::Replication.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Trove::Replication.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Trove::Replication.find(replication.id)).to eq(replication)
  end

  it 'creates its self' do
    replication.name = Time.now.usec.to_s
    expect(replication.save).to eq(true)
  end

  it 'updates its self' do
    replication.name = Time.now.usec.to_s
    expect(replication.save).to eq(true)
    replication.name = Time.now.usec.to_s
    expect(replication.save).to eq(true)
  end

  it 'deletes its self' do
    expect(replication.destroy).to eq(true)
  end
end

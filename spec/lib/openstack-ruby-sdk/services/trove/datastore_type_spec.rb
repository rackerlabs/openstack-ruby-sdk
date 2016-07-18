require 'spec_helper'

describe OpenStackRubySDK::Trove::DatastoreType, :vcr do
  let(:datastore_type){ OpenStackRubySDK::Trove::DatastoreType.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Trove::DatastoreType.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Trove::DatastoreType.find(datastore_type.id)).to eq(datastore_type)
  end

  it 'creates its self' do
    datastore_type.name = Time.now.usec.to_s
    expect(datastore_type.save).to eq(true)
  end

  it 'updates its self' do
    datastore_type.name = Time.now.usec.to_s
    expect(datastore_type.save).to eq(true)
    datastore_type.name = Time.now.usec.to_s
    expect(datastore_type.save).to eq(true)
  end

  it 'deletes its self' do
    expect(datastore_type.destroy).to eq(true)
  end
end

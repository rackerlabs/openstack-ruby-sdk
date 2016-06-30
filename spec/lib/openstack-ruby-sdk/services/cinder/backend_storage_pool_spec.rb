require 'spec_helper'

describe OpenStackRubySDK::Cinder::BackendStoragePool, :vcr do
  let(:backend_storage_pool){ OpenStackRubySDK::Cinder::BackendStoragePool.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::BackendStoragePool.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::BackendStoragePool.find(backend_storage_pool.id)).to eq(backend_storage_pool)
  end

  it 'creates its self' do
    backend_storage_pool.name = Time.now.usec.to_s
    expect(backend_storage_pool.save).to eq(true)
  end

  it 'updates its self' do
    backend_storage_pool.name = Time.now.usec.to_s
    expect(backend_storage_pool.save).to eq(true)
    backend_storage_pool.name = Time.now.usec.to_s
    expect(backend_storage_pool.save).to eq(true)
  end

  it 'deletes its self' do
    expect(backend_storage_pool.destroy).to eq(true)
  end
end

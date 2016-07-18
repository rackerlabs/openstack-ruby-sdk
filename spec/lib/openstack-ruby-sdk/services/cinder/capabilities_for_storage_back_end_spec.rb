require 'spec_helper'

describe OpenStackRubySDK::Cinder::CapabilitiesForStorageBackEnd, :vcr do
  let(:capabilities_for_storage_back_end){ OpenStackRubySDK::Cinder::CapabilitiesForStorageBackEnd.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::CapabilitiesForStorageBackEnd.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::CapabilitiesForStorageBackEnd.find(capabilities_for_storage_back_end.id)).to eq(capabilities_for_storage_back_end)
  end

  it 'creates its self' do
    capabilities_for_storage_back_end.name = Time.now.usec.to_s
    expect(capabilities_for_storage_back_end.save).to eq(true)
  end

  it 'updates its self' do
    capabilities_for_storage_back_end.name = Time.now.usec.to_s
    expect(capabilities_for_storage_back_end.save).to eq(true)
    capabilities_for_storage_back_end.name = Time.now.usec.to_s
    expect(capabilities_for_storage_back_end.save).to eq(true)
  end

  it 'deletes its self' do
    expect(capabilities_for_storage_back_end.destroy).to eq(true)
  end
end

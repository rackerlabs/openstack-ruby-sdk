require 'spec_helper'

describe OpenStackRubySDK::Cinder::VolumeTypeAccess, :vcr do
  let(:volume_type_access){ OpenStackRubySDK::Cinder::VolumeTypeAccess.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::VolumeTypeAccess.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::VolumeTypeAccess.find(volume_type_access.id)).to eq(volume_type_access)
  end

  it 'creates its self' do
    volume_type_access.name = Time.now.usec.to_s
    expect(volume_type_access.save).to eq(true)
  end

  it 'updates its self' do
    volume_type_access.name = Time.now.usec.to_s
    expect(volume_type_access.save).to eq(true)
    volume_type_access.name = Time.now.usec.to_s
    expect(volume_type_access.save).to eq(true)
  end

  it 'deletes its self' do
    expect(volume_type_access.destroy).to eq(true)
  end
end

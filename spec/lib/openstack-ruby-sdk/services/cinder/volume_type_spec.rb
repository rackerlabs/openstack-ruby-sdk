require 'spec_helper'

describe OpenStackRubySDK::Cinder::VolumeType, :vcr do
  let(:volume_type){ OpenStackRubySDK::Cinder::VolumeType.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::VolumeType.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::VolumeType.find(volume_type.id)).to eq(volume_type)
  end

  it 'creates its self' do
    volume_type.name = Time.now.usec.to_s
    expect(volume_type.save).to eq(true)
  end

  it 'updates its self' do
    volume_type.name = Time.now.usec.to_s
    expect(volume_type.save).to eq(true)
    volume_type.name = Time.now.usec.to_s
    expect(volume_type.save).to eq(true)
  end

  it 'deletes its self' do
    expect(volume_type.destroy).to eq(true)
  end
end

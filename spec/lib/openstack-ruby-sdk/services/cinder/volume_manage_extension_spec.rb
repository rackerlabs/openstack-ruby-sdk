require 'spec_helper'

describe OpenStackRubySDK::Cinder::VolumeManageExtension, :vcr do
  let(:volume_manage_extension){ OpenStackRubySDK::Cinder::VolumeManageExtension.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::VolumeManageExtension.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::VolumeManageExtension.find(volume_manage_extension.id)).to eq(volume_manage_extension)
  end

  it 'creates its self' do
    volume_manage_extension.name = Time.now.usec.to_s
    expect(volume_manage_extension.save).to eq(true)
  end

  it 'updates its self' do
    volume_manage_extension.name = Time.now.usec.to_s
    expect(volume_manage_extension.save).to eq(true)
    volume_manage_extension.name = Time.now.usec.to_s
    expect(volume_manage_extension.save).to eq(true)
  end

  it 'deletes its self' do
    expect(volume_manage_extension.destroy).to eq(true)
  end
end

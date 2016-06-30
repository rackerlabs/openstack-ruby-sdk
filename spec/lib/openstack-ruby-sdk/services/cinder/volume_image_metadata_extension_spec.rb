require 'spec_helper'

describe OpenStackRubySDK::Cinder::VolumeImageMetadataExtension, :vcr do
  let(:volume_image_metadata_extension){ OpenStackRubySDK::Cinder::VolumeImageMetadataExtension.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::VolumeImageMetadataExtension.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::VolumeImageMetadataExtension.find(volume_image_metadata_extension.id)).to eq(volume_image_metadata_extension)
  end

  it 'creates its self' do
    volume_image_metadata_extension.name = Time.now.usec.to_s
    expect(volume_image_metadata_extension.save).to eq(true)
  end

  it 'updates its self' do
    volume_image_metadata_extension.name = Time.now.usec.to_s
    expect(volume_image_metadata_extension.save).to eq(true)
    volume_image_metadata_extension.name = Time.now.usec.to_s
    expect(volume_image_metadata_extension.save).to eq(true)
  end

  it 'deletes its self' do
    expect(volume_image_metadata_extension.destroy).to eq(true)
  end
end

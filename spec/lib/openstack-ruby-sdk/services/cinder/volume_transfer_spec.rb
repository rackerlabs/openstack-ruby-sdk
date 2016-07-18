require 'spec_helper'

describe OpenStackRubySDK::Cinder::VolumeTransfer, :vcr do
  let(:volume_transfer){ OpenStackRubySDK::Cinder::VolumeTransfer.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::VolumeTransfer.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::VolumeTransfer.find(volume_transfer.id)).to eq(volume_transfer)
  end

  it 'creates its self' do
    volume_transfer.name = Time.now.usec.to_s
    expect(volume_transfer.save).to eq(true)
  end

  it 'updates its self' do
    volume_transfer.name = Time.now.usec.to_s
    expect(volume_transfer.save).to eq(true)
    volume_transfer.name = Time.now.usec.to_s
    expect(volume_transfer.save).to eq(true)
  end

  it 'deletes its self' do
    expect(volume_transfer.destroy).to eq(true)
  end
end

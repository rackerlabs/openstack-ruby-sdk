require 'spec_helper'

describe OpenStackRubySDK::Cinder::VolumeAction, :vcr do
  let(:volume_action){ OpenStackRubySDK::Cinder::VolumeAction.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::VolumeAction.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::VolumeAction.find(volume_action.id)).to eq(volume_action)
  end

  it 'creates its self' do
    volume_action.name = Time.now.usec.to_s
    expect(volume_action.save).to eq(true)
  end

  it 'updates its self' do
    volume_action.name = Time.now.usec.to_s
    expect(volume_action.save).to eq(true)
    volume_action.name = Time.now.usec.to_s
    expect(volume_action.save).to eq(true)
  end

  it 'deletes its self' do
    expect(volume_action.destroy).to eq(true)
  end
end

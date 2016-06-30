require 'spec_helper'

describe OpenStackRubySDK::Cinder::Volume, :vcr do
  let(:volume){ OpenStackRubySDK::Cinder::Volume.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::Volume.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::Volume.find(volume.id)).to eq(volume)
  end

  it 'creates its self' do
    volume.name = Time.now.usec.to_s
    expect(volume.save).to eq(true)
  end

  it 'updates its self' do
    volume.name = Time.now.usec.to_s
    expect(volume.save).to eq(true)
    volume.name = Time.now.usec.to_s
    expect(volume.save).to eq(true)
  end

  it 'deletes its self' do
    expect(volume.destroy).to eq(true)
  end
end

require 'spec_helper'

describe OpenStackRubySDK::Cinder::Volume, :vcr do
  let(:volume) do
    OpenStackRubySDK::Cinder::Volume.all.first
  end

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::Volume.all.count).to be >= 0
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::Volume.find(volume.id).id).to eq(volume.id)
  end

  it 'creates its self' do
    v = OpenStackRubySDK::Cinder::Volume.new
    v.name = Time.now.usec.to_s
    v.size = '100'
    v.save

    expect(v.status).to eq('creating')
  end

  it 'updates its self' do
    expect do
      volume.name = Time.now.usec.to_s
      volume.save
    end.to change{ volume.name }
  end

  it 'deletes its self' do
    expect(volume.destroy).to eq(true)
  end
end

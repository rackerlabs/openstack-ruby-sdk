require 'spec_helper'

describe OpenStackRubySDK::Cinder::VolumeSnapshot, :vcr do
  let(:volume) { fresh_volume }
  let(:snapshot) { volume.take_snapshot!("name", "description") }

  it 'is creatable' do
    expect(snapshot.name).to eq("name")
  end

  it 'is deletable' do
    expect(snapshot.destroy).to eq(true)
  end

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::VolumeSnapshot.all.count).to be >= 0
  end

  it 'updates its self' do
    title = "Something different"
    snapshot.name = title
    snapshot.save
    expect(snapshot.name).to eq(title)
  end

  # it 'gets its self' do
  #   expect(OpenStackRubySDK::Cinder::VolumeSnapshot.find(volume_snapshot.id)).to eq(volume_snapshot)
  # end
  #
end

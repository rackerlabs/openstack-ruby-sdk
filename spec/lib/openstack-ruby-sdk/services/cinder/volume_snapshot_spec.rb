require 'spec_helper'

describe OpenStackRubySDK::Cinder::VolumeSnapshot, :vcr do
  let(:server) { server_with_volume }
  let(:mounted_volume) { server.volumes.first }
  let(:volume) { fresh_volume }

  it 'is creatable' do
    snapshot = volume.take_snapshot!("name", "description")
    expect(snapshot.name).to eq("name")
  end

  # it 'gets an index' do
  #   expect(OpenStackRubySDK::Cinder::VolumeSnapshot.all).to eq([])
  # end
  #
  # it 'gets its self' do
  #   expect(OpenStackRubySDK::Cinder::VolumeSnapshot.find(volume_snapshot.id)).to eq(volume_snapshot)
  # end
  #
  # it 'creates its self' do
  #   volume_snapshot.name = Time.now.usec.to_s
  #   expect(volume_snapshot.save).to eq(true)
  # end
  #
  # it 'updates its self' do
  #   volume_snapshot.name = Time.now.usec.to_s
  #   expect(volume_snapshot.save).to eq(true)
  #   volume_snapshot.name = Time.now.usec.to_s
  #   expect(volume_snapshot.save).to eq(true)
  # end
  #
  # it 'deletes its self' do
  #   expect(volume_snapshot.destroy).to eq(true)
  # end
end

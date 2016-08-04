require 'spec_helper'

describe OpenStackRubySDK::Cinder::Backup, :vcr do
  let(:volume){ fresh_volume}
  let(:backup) do
    OpenStackRubySDK::Cinder::Backup.create({
      description: "description",
      name: "name",
      volume_id: fresh_volume.id,
      incremental: false
    })
  end

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::Backup.all.count).to be >= 0
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::Backup.find(backup.id).id).to eq(backup.id)
  end

  it 'creates its self' do
    backup.reload
    expect(backup.availability_zone).to eq("nova")
    expect(backup.description).to eq("description")
    expect(backup.name).to eq("name")
    expect(backup.id).to be_present
  end

  it 'deletes its self' do
    Peace::Helpers.wait_for(backup, "available")
    expect(backup.destroy).to eq(true)
  end

  it 'restores its self' do
    Peace::Helpers.wait_for(backup, "available")
    restore = backup.restore!(volume)
    expect(restore["restore"]["backup_id"]).to eq(backup.id)
    expect(restore["restore"]["volume_id"]).to eq(volume.id)
  end

  it 'force-deletes its self' do
    Peace::Helpers.wait_for(backup, "available")
    expect(backup.force_delete!).to eq(true)
  end
end

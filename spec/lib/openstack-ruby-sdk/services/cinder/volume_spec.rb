require 'spec_helper'

describe OpenStackRubySDK::Cinder::Volume, :vcr do
  let(:server) { server_with_volume }
  let(:mounted_volume) { server.volumes.first }
  let(:volume) { fresh_volume }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::Volume.all.count).to be >= 0
  end

  it 'creates its self' do
    v = OpenStackRubySDK::Cinder::Volume.new
    v.name = Time.now.usec.to_s
    v.size = '10'
    v.save

    expect(v.status).to eq('creating')
  end

  it 'updates its self' do
    expect do
      volume.name = Time.now.usec.to_s
      volume.save
    end.to change{ volume.name }
  end

  it 'can be resized' do
    expect do
      volume.extend_size(11)
      Peace::Helpers.wait_for(volume, 'available')
      volume.reload
    end.to change(volume, :size).to(11)
  end

  it 'can reset it statuses' do
    expect do
      volume.reset_status({status: 'creating'})
      volume.reload
    end.to change(volume, :status).to('creating')
  end

  it 'can attach its self to a server' do
    volume_attachment = volume.attach_to(server)
    expect(volume_attachment.server_id).to eq(server.id)
    expect(volume_attachment.volume_id).to eq(volume.id)
    # /vdc is the second mount point
    expect(volume_attachment.device).to eq("/dev/vdc")
  end

  it 'can force deattach its self to a server' do
    volume.attach_to(server)
    Peace::Helpers.wait_for(volume, "in-use")
    expect(volume.force_detach!).to be(true)
    volume.reload
    expect(volume.attachments).to eq([])
  end

  it 'deletes its self' do
    expect(volume.destroy).to eq(true)
  end
end

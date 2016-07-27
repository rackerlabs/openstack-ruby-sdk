require 'spec_helper'

describe OpenStackRubySDK::Cinder::Volume, :vcr do
  let(:flavor_id) { '1' }
  let(:image_id) { '7c5d126c-c468-4436-bfca-a001d9ea6fea' }
  let(:server) do
    s = OpenStackRubySDK::Nova::Server.create({
      flavorRef: flavor_id,
      imageRef: image_id,
      name: Time.now.usec.to_s
    })

    Peace::Helpers.wait_for(s)
  end
  let(:volume) do
    v = OpenStackRubySDK::Cinder::Volume.create({
      name: Time.now.usec.to_s,
      size: '10'
    })
    Peace::Helpers.wait_for(v, 'available')
  end

  # after(:all) do
  #   OpenStackRubySDK::Nova::Server.all.each{ |s| s.destroy }
  #   OpenStackRubySDK::Cinder::Volume.all.each{ |v| v.destroy }
  # end

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::Volume.all.count).to be >= 0
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::Volume.find(volume.id).id).to eq(volume.id)
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
    expect(volume_attachment.device).to eq("/dev/vdb")
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

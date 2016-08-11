require 'spec_helper'

describe OpenStackRubySDK::Nova::Server, :vcr do
  let!(:server) { fresh_server }
  let(:volume) { fresh_volume }

  it 'creates its self' do
    expect(server.class).to eq(OpenStackRubySDK::Nova::Server)
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Nova::Server.find(server.id).id).to eq(server.id)
  end

  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::Server.all.count).to be >= 0
  end

  it 'updates its self' do
    server.name = Time.now.usec.to_s
    expect{ server.save; server.reload }.to change{ server.updated }
  end

  it 'deletes its self' do
    expect(server.destroy).to eq(true)
  end

  it 'updates the admin password' do
    skip "Is this RAX only?"
    # expect{ server.change_password("j3Peu626UnDJ") }.to change{ server.updated }
  end

  it 'creates an image' do
    expect {
      server.create_image('Testing')
    }.to change {
      OpenStackRubySDK::Nova::Image.all.count
    }.by(1)
  end

  it 'can reboot' do
    expect(server.reboot).to eq(true)
  end

  it 'can resize' do
    expect(server.flavor['id']).to eq("1")
    expect(server.resize("2")).to eq(true)
    Peace::Helpers.wait_for(server, 'VERIFY_RESIZE')
    server.confirm_resize
    Peace::Helpers.wait_for(server)
    expect(server.flavor['id']).to eq("2")
  end

  it 'can revert a resize' do
    expect(server.flavor['id']).to eq("1")
    expect(server.resize("2")).to eq(true)
    Peace::Helpers.wait_for(server, 'VERIFY_RESIZE')
    server.revert_resize
    Peace::Helpers.wait_for(server)
    expect(server.flavor['id']).to eq("1")
  end

  it 'can be rescued' do
    expect(server.rescue(IMAGE_ID)['adminPass']).to be_present
    Peace::Helpers.wait_for(server, 'RESCUE')
    expect(server.state).to eq('RESCUE')
  end

  it 'can be rebuilt' do
    server.rebuild
    Peace::Helpers.wait_for(server, 'REBUILD')
    expect(server.state).to eq('REBUILD')
  end

  it 'gets its own details' do
    server.details
    expect(server.config_drive).to eq("")
    expect(server.power_state).to eq(1)
  end

  it 'knows about associated keypairs' do
    expect(server.key_pairs.count).to be >= 0
  end

  it 'knows about associated volumes' do
    expect(server.volumes).to eq([])
  end

  it 'knows about associated actions' do
    expect(server.available_actions).to eq([])
  end

  it 'is creatable with a volume' do
    skip 'It asks for a device UUID when creating?'
    # https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#create-bootable-volume-and-server
    # data = {
    #   uuid: '',
    #   imageRef: '34694dc4-a9b4-4b1c-97a7-c12296950619',
    #   volume_size: '100',
    #   name: 'testing',
    #   flavorRef: '1'
    # }
    #
    # OpenStackRubySDK::Nova::Server.create_from_volume(data)
  end

  it 'can attach a volume' do
    a = server.attach_volume(volume.id)
    Peace::Helpers.wait_for(volume, "in-use")
    Peace::Helpers.wait_for(server)
    expect(a.server_id).to eq(server.id)
    expect(a.volume_id).to eq(volume.id)
  end

  it 'can deattach a volume' do
    do_it_live
    attachment = server.attach_volume(volume.id)
    Peace::Helpers.wait_for(volume, "in-use")
    Peace::Helpers.wait_for(server)
    expect(server.detach_volume(volume.id)).to eq(true)
    Peace::Helpers.wait_for(volume, "available")
    Peace::Helpers.wait_for(server)
    expect(server.volume_attachments).to eq([])
  end

  it 'can get details about volume attachments' do
    server.attach_volume(volume.id)
    Peace::Helpers.wait_for(volume, "in-use")
    Peace::Helpers.wait_for(server)
    attachments = server.volume_attachments
    expect(attachments.size).to eq(1)
    expect(attachments.first.server_id).to eq(server.id)
    expect(attachments.first.volume_id).to eq(volume.id)
    expect(attachments.first.device).to be_present
  end

  it 'can get a console' do
    skip 'Rackspace only'
    expect(server.console).to raise_error
  end

  it 'lists virtual interfaces' do
    # This will only work when an admin is configured in policy.json
    expect { server.virtual_interfaces }.to raise_error Peace::BadRequest
  end

  it 'has metadata' do
    expect(server.metadata).to eq({})
  end

  it 'can save metadata' do
    server.set_metadata({some: 'value'})
    expect(server.metadata).to eq({'some' => 'value'})
  end

end

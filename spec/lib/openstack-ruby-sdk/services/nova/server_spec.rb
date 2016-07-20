require 'spec_helper'

describe OpenStackRubySDK::Nova::Server, :vcr do
  let(:flavor_id) { '1' }
  let(:image_id) { '9060f38f-bb54-4806-a2b3-24a2173af252' }
  let(:volume_id){ 'f2176250-b0d9-4e3f-948c-df959dfba6fc' }
  let(:server) do
    s = OpenStackRubySDK::Nova::Server.create({
      flavorRef: flavor_id,
      imageRef: image_id,
      name: Time.now.usec.to_s
    })

    Peace::Helpers.wait_for(s)
  end

  after do
    OpenStackRubySDK::Nova::Server.all.each{ |s| s.destroy }
  end

  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::Server.all).to eq([])
  end

  it 'creates its self' do
    expect(server.class).to eq(OpenStackRubySDK::Nova::Server)
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Nova::Server.find(server.id).id).to eq(server.id)
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
    expect(server.rescue(image_id)['adminPass']).to be_present
    Peace::Helpers.wait_for(server, 'RESCUE')
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
    attachment = server.attach_volume(volume_id)
    expect(attachment.server_id).to eq(server.id)
    expect(attachment.volume_id).to eq(volume_id)
  end

  it 'can deattach a volume' do
    attachment = server.attach_volume(volume_id)
    sleep 3 if VCR.current_cassette.recording?
    server.reload
    expect(server.detach_volume(volume_id)).to eq(true)
  end

  it 'can get details about volume attachments' do
    server.attach_volume(volume_id)
    server.reload
    attachments = server.volume_attachments
    expect(attachments.size).to eq(1)
    expect(attachments.first.server_id).to eq(server.id)
    expect(attachments.first.volume_id).to eq(volume_id)
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

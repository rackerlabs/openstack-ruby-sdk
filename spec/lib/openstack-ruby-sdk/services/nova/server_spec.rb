require 'spec_helper'

describe OpenStackRubySDK::Nova::Server, :vcr do
  let(:flavor_id) { '1' }
  let(:image_id) { '9060f38f-bb54-4806-a2b3-24a2173af252' }
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
    expect(server.key_pairs).to eq([])
  end

  it 'knows about associated volumes' do
    expect(server.volumes).to eq([])
  end

  it 'knows about associated actions' do
    expect(server.available_actions).to eq([])
  end

end

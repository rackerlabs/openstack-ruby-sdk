require 'spec_helper'

describe OpenStackRubySDK::Nova::Server, :vcr do
  let(:flavor_id) { '1' }
  let(:image_id) { '9060f38f-bb54-4806-a2b3-24a2173af252' }
  let(:server) do
    OpenStackRubySDK::Nova::Server.create({
      flavorRef: flavor_id,
      imageRef: image_id,
      name: Time.now.usec.to_s
    })
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
    expect{ server.save }.to change{ server.updated }
  end

  it 'deletes its self' do
    expect(server.destroy).to eq(true)
  end

  it 'updates the admin password' do
    skip "Is this RAX only?"
    # Peace::Helpers.wait_for(server)
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

end

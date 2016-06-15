require 'spec_helper'

describe OpenStackRubySDK::Nova::Server, :vcr do
  let(:flavorRef){ 1 }
  let(:imageRef){ "9060f38f-bb54-4806-a2b3-24a2173af252" }
  let(:server) do
    s           = OpenStackRubySDK::Nova::Server.new
    s.name      = "Testing"
    s.flavorRef = flavorRef
    s.imageRef  = imageRef
    s.save
    s.reload
  end

  it 'can create instances' do
    expect(server.id).to be_present
  end

  it 'can change the admin password' do
    expect(server.change_password('TESTING')).to eq true
  end

  it 'can reboot' do
    expect(server.reboot).to eq true
  end

  it 'can create an image of its self' do
    expect(server.create_image("testing")).to eq true
  end

end

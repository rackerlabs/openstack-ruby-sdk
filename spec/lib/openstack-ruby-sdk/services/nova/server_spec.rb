require 'spec_helper'

describe OpenStackRubySDK::Nova::Server, :vcr do
  let(:server){ OpenStackRubySDK::Nova::Server.first }

  it 'can create instances' do
    expect(server.id).to be_present
  end

  it 'can change the admin password' do
    pending
    expect(server.change_password('TESTING')).to eq true
  end

  it 'can reboot' do
    expect(server.reboot).to eq true
  end

  it 'can create an image of its self' do
    expect(server.create_image("testing")).to eq true
  end

end

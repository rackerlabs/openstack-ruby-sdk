require 'spec_helper'

describe OpenStackRubySDK::Nova::Server, :vcr do
  let(:server){ OpenStackRubySDK::Nova::Server.first }

  it 'can create instances' do
    expect(server.id).to be_present
  end

  it 'can change the admin password' do
    pending
    # TODO: This leaves the server in vm_error state
    expect(server.change_password('TESTING')).to eq true
  end

  it 'can soft reboot' do
    expect(server.reboot).to eq true
  end

  it 'can hard reboot' do
    expect(server.reboot('HARD')).to eq true
  end

  it 'can create an image of its self' do
    expect(server.create_image("testing")).to eq true
  end

  it 'can be rescued' do
    expect(server.rescue).to eq true
    sleep 10
    expect(server.unrescue).to eq true
  end

  it 'can be resized' do
    expect(server.resize(3)).to eq true
    # sleep 10
    expect(server.confirm_resize).to eq true
  end

end

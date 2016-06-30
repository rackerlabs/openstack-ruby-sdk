require 'spec_helper'

describe OpenStackRubySDK::Nova::VirtualInterface, :vcr do
  let(:virtual_interface){ OpenStackRubySDK::Nova::VirtualInterface.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::VirtualInterface.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Nova::VirtualInterface.find(virtual_interface.id)).to eq(virtual_interface)
  end

  it 'creates its self' do
    virtual_interface.name = Time.now.usec.to_s
    expect(virtual_interface.save).to eq(true)
  end

  it 'updates its self' do
    virtual_interface.name = Time.now.usec.to_s
    expect(virtual_interface.save).to eq(true)
    virtual_interface.name = Time.now.usec.to_s
    expect(virtual_interface.save).to eq(true)
  end

  it 'deletes its self' do
    expect(virtual_interface.destroy).to eq(true)
  end
end

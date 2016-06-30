require 'spec_helper'

describe OpenStackRubySDK::Neutron::Port, :vcr do
  let(:port){ OpenStackRubySDK::Neutron::Port.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Neutron::Port.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Neutron::Port.find(port.id)).to eq(port)
  end

  it 'creates its self' do
    port.name = Time.now.usec.to_s
    expect(port.save).to eq(true)
  end

  it 'updates its self' do
    port.name = Time.now.usec.to_s
    expect(port.save).to eq(true)
    port.name = Time.now.usec.to_s
    expect(port.save).to eq(true)
  end

  it 'deletes its self' do
    expect(port.destroy).to eq(true)
  end
end

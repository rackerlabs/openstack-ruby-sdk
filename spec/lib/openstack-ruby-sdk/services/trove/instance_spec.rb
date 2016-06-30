require 'spec_helper'

describe OpenStackRubySDK::Trove::Instance, :vcr do
  let(:instance){ OpenStackRubySDK::Trove::Instance.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Trove::Instance.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Trove::Instance.find(instance.id)).to eq(instance)
  end

  it 'creates its self' do
    instance.name = Time.now.usec.to_s
    expect(instance.save).to eq(true)
  end

  it 'updates its self' do
    instance.name = Time.now.usec.to_s
    expect(instance.save).to eq(true)
    instance.name = Time.now.usec.to_s
    expect(instance.save).to eq(true)
  end

  it 'deletes its self' do
    expect(instance.destroy).to eq(true)
  end
end

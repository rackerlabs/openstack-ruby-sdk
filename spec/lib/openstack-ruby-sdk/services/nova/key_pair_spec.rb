require 'spec_helper'

describe OpenStackRubySDK::Nova::KeyPair, :vcr do
  let(:key_pair){ OpenStackRubySDK::Nova::KeyPair.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::KeyPair.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Nova::KeyPair.find(key_pair.id)).to eq(key_pair)
  end

  it 'creates its self' do
    key_pair.name = Time.now.usec.to_s
    expect(key_pair.save).to eq(true)
  end

  it 'updates its self' do
    key_pair.name = Time.now.usec.to_s
    expect(key_pair.save).to eq(true)
    key_pair.name = Time.now.usec.to_s
    expect(key_pair.save).to eq(true)
  end

  it 'deletes its self' do
    expect(key_pair.destroy).to eq(true)
  end
end

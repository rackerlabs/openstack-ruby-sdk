require 'spec_helper'

describe OpenStackRubySDK::Keystone::Credential do
  let(:credential){ OpenStackRubySDK::Keystone::Credential.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Keystone::Credential.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Keystone::Credential.find(credential.id)).to eq(credential)
  end

  it 'creates its self' do
    credential.name = Time.now.usec.to_s
    expect(credential.save).to eq(true)
  end

  it 'updates its self' do
    credential.name = Time.now.usec.to_s
    expect(credential.save).to eq(true)
    credential.name = Time.now.usec.to_s
    expect(credential.save).to eq(true)
  end

  it 'deletes its self' do
    expect(credential.destroy).to eq(true)
  end
end

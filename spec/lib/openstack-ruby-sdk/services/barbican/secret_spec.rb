require 'spec_helper'

describe OpenStackRubySDK::Barbican::Secret, :vcr do
  let(:secret){ OpenStackRubySDK::Barbican::Secret.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Barbican::Secret.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Barbican::Secret.find(secret.id)).to eq(secret)
  end

  it 'creates its self' do
    secret.name = Time.now.usec.to_s
    expect(secret.save).to eq(true)
  end

  it 'updates its self' do
    secret.name = Time.now.usec.to_s
    expect(secret.save).to eq(true)
    secret.name = Time.now.usec.to_s
    expect(secret.save).to eq(true)
  end

  it 'deletes its self' do
    expect(secret.destroy).to eq(true)
  end
end

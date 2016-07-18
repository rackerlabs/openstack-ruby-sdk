require 'spec_helper'

describe OpenStackRubySDK::Keystone::Oauth, :vcr do
  let(:oauth){ OpenStackRubySDK::Keystone::Oauth.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Keystone::Oauth.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Keystone::Oauth.find(oauth.id)).to eq(oauth)
  end

  it 'creates its self' do
    oauth.name = Time.now.usec.to_s
    expect(oauth.save).to eq(true)
  end

  it 'updates its self' do
    oauth.name = Time.now.usec.to_s
    expect(oauth.save).to eq(true)
    oauth.name = Time.now.usec.to_s
    expect(oauth.save).to eq(true)
  end

  it 'deletes its self' do
    expect(oauth.destroy).to eq(true)
  end
end

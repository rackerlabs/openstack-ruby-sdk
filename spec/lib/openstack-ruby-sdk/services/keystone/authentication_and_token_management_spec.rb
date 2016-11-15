require 'spec_helper'

describe OpenStackRubySDK::Keystone::AuthenticationAndTokenManagement do
  let(:authentication_and_token_management){ OpenStackRubySDK::Keystone::AuthenticationAndTokenManagement.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Keystone::AuthenticationAndTokenManagement.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Keystone::AuthenticationAndTokenManagement.find(authentication_and_token_management.id)).to eq(authentication_and_token_management)
  end

  it 'creates its self' do
    authentication_and_token_management.name = Time.now.usec.to_s
    expect(authentication_and_token_management.save).to eq(true)
  end

  it 'updates its self' do
    authentication_and_token_management.name = Time.now.usec.to_s
    expect(authentication_and_token_management.save).to eq(true)
    authentication_and_token_management.name = Time.now.usec.to_s
    expect(authentication_and_token_management.save).to eq(true)
  end

  it 'deletes its self' do
    expect(authentication_and_token_management.destroy).to eq(true)
  end
end

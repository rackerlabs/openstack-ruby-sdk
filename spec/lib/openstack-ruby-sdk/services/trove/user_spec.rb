require 'spec_helper'

describe OpenStackRubySDK::Trove::User, :vcr do
  let(:user){ OpenStackRubySDK::Trove::User.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Trove::User.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Trove::User.find(user.id)).to eq(user)
  end

  it 'creates its self' do
    user.name = Time.now.usec.to_s
    expect(user.save).to eq(true)
  end

  it 'updates its self' do
    user.name = Time.now.usec.to_s
    expect(user.save).to eq(true)
    user.name = Time.now.usec.to_s
    expect(user.save).to eq(true)
  end

  it 'deletes its self' do
    expect(user.destroy).to eq(true)
  end
end

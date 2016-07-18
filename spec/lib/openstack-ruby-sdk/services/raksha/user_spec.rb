require 'spec_helper'

describe OpenStackRubySDK::Raksha::User, :vcr do
  let(:user){ OpenStackRubySDK::Raksha::User.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Raksha::User.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Raksha::User.find(user.id)).to eq(user)
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

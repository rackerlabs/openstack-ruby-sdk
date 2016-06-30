require 'spec_helper'

describe OpenStackRubySDK::Swift::Account, :vcr do
  let(:account){ OpenStackRubySDK::Swift::Account.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Swift::Account.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Swift::Account.find(account.id)).to eq(account)
  end

  it 'creates its self' do
    account.name = Time.now.usec.to_s
    expect(account.save).to eq(true)
  end

  it 'updates its self' do
    account.name = Time.now.usec.to_s
    expect(account.save).to eq(true)
    account.name = Time.now.usec.to_s
    expect(account.save).to eq(true)
  end

  it 'deletes its self' do
    expect(account.destroy).to eq(true)
  end
end

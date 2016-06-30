require 'spec_helper'

describe OpenStackRubySDK::Barbican::Quotum, :vcr do
  let(:quota){ OpenStackRubySDK::Barbican::Quotum.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Barbican::Quotum.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Barbican::Quotum.find(quota.id)).to eq(quota)
  end

  it 'creates its self' do
    quota.name = Time.now.usec.to_s
    expect(quota.save).to eq(true)
  end

  it 'updates its self' do
    quota.name = Time.now.usec.to_s
    expect(quota.save).to eq(true)
    quota.name = Time.now.usec.to_s
    expect(quota.save).to eq(true)
  end

  it 'deletes its self' do
    expect(quota.destroy).to eq(true)
  end
end

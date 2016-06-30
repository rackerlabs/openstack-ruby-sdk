require 'spec_helper'

describe OpenStackRubySDK::Designate::Subdomain, :vcr do
  let(:subdomain){ OpenStackRubySDK::Designate::Subdomain.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Designate::Subdomain.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Designate::Subdomain.find(subdomain.id)).to eq(subdomain)
  end

  it 'creates its self' do
    subdomain.name = Time.now.usec.to_s
    expect(subdomain.save).to eq(true)
  end

  it 'updates its self' do
    subdomain.name = Time.now.usec.to_s
    expect(subdomain.save).to eq(true)
    subdomain.name = Time.now.usec.to_s
    expect(subdomain.save).to eq(true)
  end

  it 'deletes its self' do
    expect(subdomain.destroy).to eq(true)
  end
end

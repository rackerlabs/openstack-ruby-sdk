require 'spec_helper'

describe OpenStackRubySDK::Designate::ReverseDNS, :vcr do
  let(:reverse_dns){ OpenStackRubySDK::Designate::ReverseDNS.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Designate::ReverseDNS.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Designate::ReverseDNS.find(reverse_dns.id)).to eq(reverse_dns)
  end

  it 'creates its self' do
    reverse_dns.name = Time.now.usec.to_s
    expect(reverse_dns.save).to eq(true)
  end

  it 'updates its self' do
    reverse_dns.name = Time.now.usec.to_s
    expect(reverse_dns.save).to eq(true)
    reverse_dns.name = Time.now.usec.to_s
    expect(reverse_dns.save).to eq(true)
  end

  it 'deletes its self' do
    expect(reverse_dns.destroy).to eq(true)
  end
end

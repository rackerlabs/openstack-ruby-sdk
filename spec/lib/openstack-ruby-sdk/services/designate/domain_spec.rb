require 'spec_helper'

describe OpenStackRubySDK::Designate::Domain, :vcr do
  let(:domain){ OpenStackRubySDK::Designate::Domain.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Designate::Domain.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Designate::Domain.find(domain.id)).to eq(domain)
  end

  it 'creates its self' do
    domain.name = Time.now.usec.to_s
    expect(domain.save).to eq(true)
  end

  it 'updates its self' do
    domain.name = Time.now.usec.to_s
    expect(domain.save).to eq(true)
    domain.name = Time.now.usec.to_s
    expect(domain.save).to eq(true)
  end

  it 'deletes its self' do
    expect(domain.destroy).to eq(true)
  end
end

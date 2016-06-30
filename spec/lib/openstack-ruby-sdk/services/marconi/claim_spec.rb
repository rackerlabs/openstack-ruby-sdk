require 'spec_helper'

describe OpenStackRubySDK::Marconi::Claim, :vcr do
  let(:claim){ OpenStackRubySDK::Marconi::Claim.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Marconi::Claim.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Marconi::Claim.find(claim.id)).to eq(claim)
  end

  it 'creates its self' do
    claim.name = Time.now.usec.to_s
    expect(claim.save).to eq(true)
  end

  it 'updates its self' do
    claim.name = Time.now.usec.to_s
    expect(claim.save).to eq(true)
    claim.name = Time.now.usec.to_s
    expect(claim.save).to eq(true)
  end

  it 'deletes its self' do
    expect(claim.destroy).to eq(true)
  end
end

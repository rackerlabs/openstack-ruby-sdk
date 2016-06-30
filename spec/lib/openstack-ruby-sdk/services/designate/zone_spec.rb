require 'spec_helper'

describe OpenStackRubySDK::Designate::Zone, :vcr do
  let(:zone){ OpenStackRubySDK::Designate::Zone.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Designate::Zone.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Designate::Zone.find(zone.id)).to eq(zone)
  end

  it 'creates its self' do
    zone.name = Time.now.usec.to_s
    expect(zone.save).to eq(true)
  end

  it 'updates its self' do
    zone.name = Time.now.usec.to_s
    expect(zone.save).to eq(true)
    zone.name = Time.now.usec.to_s
    expect(zone.save).to eq(true)
  end

  it 'deletes its self' do
    expect(zone.destroy).to eq(true)
  end
end

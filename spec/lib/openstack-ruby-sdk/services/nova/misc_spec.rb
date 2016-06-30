require 'spec_helper'

describe OpenStackRubySDK::Nova::Misc, :vcr do
  let(:misc){ OpenStackRubySDK::Nova::Misc.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::Misc.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Nova::Misc.find(misc.id)).to eq(misc)
  end

  it 'creates its self' do
    misc.name = Time.now.usec.to_s
    expect(misc.save).to eq(true)
  end

  it 'updates its self' do
    misc.name = Time.now.usec.to_s
    expect(misc.save).to eq(true)
    misc.name = Time.now.usec.to_s
    expect(misc.save).to eq(true)
  end

  it 'deletes its self' do
    expect(misc.destroy).to eq(true)
  end
end

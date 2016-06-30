require 'spec_helper'

describe OpenStackRubySDK::Savanna::Script, :vcr do
  let(:script){ OpenStackRubySDK::Savanna::Script.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Savanna::Script.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Savanna::Script.find(script.id)).to eq(script)
  end

  it 'creates its self' do
    script.name = Time.now.usec.to_s
    expect(script.save).to eq(true)
  end

  it 'updates its self' do
    script.name = Time.now.usec.to_s
    expect(script.save).to eq(true)
    script.name = Time.now.usec.to_s
    expect(script.save).to eq(true)
  end

  it 'deletes its self' do
    expect(script.destroy).to eq(true)
  end
end

require 'spec_helper'

describe OpenStackRubySDK::Designate::Record, :vcr do
  let(:record){ OpenStackRubySDK::Designate::Record.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Designate::Record.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Designate::Record.find(record.id)).to eq(record)
  end

  it 'creates its self' do
    record.name = Time.now.usec.to_s
    expect(record.save).to eq(true)
  end

  it 'updates its self' do
    record.name = Time.now.usec.to_s
    expect(record.save).to eq(true)
    record.name = Time.now.usec.to_s
    expect(record.save).to eq(true)
  end

  it 'deletes its self' do
    expect(record.destroy).to eq(true)
  end
end

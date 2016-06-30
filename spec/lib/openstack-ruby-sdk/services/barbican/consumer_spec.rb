require 'spec_helper'

describe OpenStackRubySDK::Barbican::Consumer, :vcr do
  let(:consumer){ OpenStackRubySDK::Barbican::Consumer.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Barbican::Consumer.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Barbican::Consumer.find(consumer.id)).to eq(consumer)
  end

  it 'creates its self' do
    consumer.name = Time.now.usec.to_s
    expect(consumer.save).to eq(true)
  end

  it 'updates its self' do
    consumer.name = Time.now.usec.to_s
    expect(consumer.save).to eq(true)
    consumer.name = Time.now.usec.to_s
    expect(consumer.save).to eq(true)
  end

  it 'deletes its self' do
    expect(consumer.destroy).to eq(true)
  end
end

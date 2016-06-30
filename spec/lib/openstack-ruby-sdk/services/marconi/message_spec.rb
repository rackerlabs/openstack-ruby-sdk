require 'spec_helper'

describe OpenStackRubySDK::Marconi::Message, :vcr do
  let(:message){ OpenStackRubySDK::Marconi::Message.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Marconi::Message.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Marconi::Message.find(message.id)).to eq(message)
  end

  it 'creates its self' do
    message.name = Time.now.usec.to_s
    expect(message.save).to eq(true)
  end

  it 'updates its self' do
    message.name = Time.now.usec.to_s
    expect(message.save).to eq(true)
    message.name = Time.now.usec.to_s
    expect(message.save).to eq(true)
  end

  it 'deletes its self' do
    expect(message.destroy).to eq(true)
  end
end

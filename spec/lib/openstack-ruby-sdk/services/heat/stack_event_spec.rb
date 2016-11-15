require 'spec_helper'

describe OpenStackRubySDK::Heat::StackEvent do
  let(:stack_event){ OpenStackRubySDK::Heat::StackEvent.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Heat::StackEvent.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Heat::StackEvent.find(stack_event.id)).to eq(stack_event)
  end

  it 'creates its self' do
    stack_event.name = Time.now.usec.to_s
    expect(stack_event.save).to eq(true)
  end

  it 'updates its self' do
    stack_event.name = Time.now.usec.to_s
    expect(stack_event.save).to eq(true)
    stack_event.name = Time.now.usec.to_s
    expect(stack_event.save).to eq(true)
  end

  it 'deletes its self' do
    expect(stack_event.destroy).to eq(true)
  end
end

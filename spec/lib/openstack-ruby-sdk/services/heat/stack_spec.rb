require 'spec_helper'

describe OpenStackRubySDK::Heat::Stack do
  let(:stack){ OpenStackRubySDK::Heat::Stack.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Heat::Stack.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Heat::Stack.find(stack.id)).to eq(stack)
  end

  it 'creates its self' do
    stack.name = Time.now.usec.to_s
    expect(stack.save).to eq(true)
  end

  it 'updates its self' do
    stack.name = Time.now.usec.to_s
    expect(stack.save).to eq(true)
    stack.name = Time.now.usec.to_s
    expect(stack.save).to eq(true)
  end

  it 'deletes its self' do
    expect(stack.destroy).to eq(true)
  end
end

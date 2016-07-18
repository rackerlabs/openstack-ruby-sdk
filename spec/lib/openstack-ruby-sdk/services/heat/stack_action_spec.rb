require 'spec_helper'

describe OpenStackRubySDK::Heat::StackAction, :vcr do
  let(:stack_action){ OpenStackRubySDK::Heat::StackAction.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Heat::StackAction.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Heat::StackAction.find(stack_action.id)).to eq(stack_action)
  end

  it 'creates its self' do
    stack_action.name = Time.now.usec.to_s
    expect(stack_action.save).to eq(true)
  end

  it 'updates its self' do
    stack_action.name = Time.now.usec.to_s
    expect(stack_action.save).to eq(true)
    stack_action.name = Time.now.usec.to_s
    expect(stack_action.save).to eq(true)
  end

  it 'deletes its self' do
    expect(stack_action.destroy).to eq(true)
  end
end

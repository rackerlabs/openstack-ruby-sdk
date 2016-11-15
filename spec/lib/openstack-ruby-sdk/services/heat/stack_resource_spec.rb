require 'spec_helper'

describe OpenStackRubySDK::Heat::StackResource do
  let(:stack_resource){ OpenStackRubySDK::Heat::StackResource.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Heat::StackResource.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Heat::StackResource.find(stack_resource.id)).to eq(stack_resource)
  end

  it 'creates its self' do
    stack_resource.name = Time.now.usec.to_s
    expect(stack_resource.save).to eq(true)
  end

  it 'updates its self' do
    stack_resource.name = Time.now.usec.to_s
    expect(stack_resource.save).to eq(true)
    stack_resource.name = Time.now.usec.to_s
    expect(stack_resource.save).to eq(true)
  end

  it 'deletes its self' do
    expect(stack_resource.destroy).to eq(true)
  end
end

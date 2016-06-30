require 'spec_helper'

describe OpenStackRubySDK::Savanna::Node, :vcr do
  let(:node){ OpenStackRubySDK::Savanna::Node.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Savanna::Node.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Savanna::Node.find(node.id)).to eq(node)
  end

  it 'creates its self' do
    node.name = Time.now.usec.to_s
    expect(node.save).to eq(true)
  end

  it 'updates its self' do
    node.name = Time.now.usec.to_s
    expect(node.save).to eq(true)
    node.name = Time.now.usec.to_s
    expect(node.save).to eq(true)
  end

  it 'deletes its self' do
    expect(node.destroy).to eq(true)
  end
end

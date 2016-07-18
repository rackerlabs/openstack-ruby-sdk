require 'spec_helper'

describe OpenStackRubySDK::Marconi::Queue, :vcr do
  let(:queue){ OpenStackRubySDK::Marconi::Queue.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Marconi::Queue.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Marconi::Queue.find(queue.id)).to eq(queue)
  end

  it 'creates its self' do
    queue.name = Time.now.usec.to_s
    expect(queue.save).to eq(true)
  end

  it 'updates its self' do
    queue.name = Time.now.usec.to_s
    expect(queue.save).to eq(true)
    queue.name = Time.now.usec.to_s
    expect(queue.save).to eq(true)
  end

  it 'deletes its self' do
    expect(queue.destroy).to eq(true)
  end
end

require 'spec_helper'

describe OpenStackRubySDK::Glance::Task do
  let(:task){ OpenStackRubySDK::Glance::Task.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Glance::Task.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Glance::Task.find(task.id)).to eq(task)
  end

  it 'creates its self' do
    task.name = Time.now.usec.to_s
    expect(task.save).to eq(true)
  end

  it 'updates its self' do
    task.name = Time.now.usec.to_s
    expect(task.save).to eq(true)
    task.name = Time.now.usec.to_s
    expect(task.save).to eq(true)
  end

  it 'deletes its self' do
    expect(task.destroy).to eq(true)
  end
end

require 'spec_helper'

describe OpenStackRubySDK::Raksha::Agent, :vcr do
  let(:agent){ OpenStackRubySDK::Raksha::Agent.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Raksha::Agent.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Raksha::Agent.find(agent.id)).to eq(agent)
  end

  it 'creates its self' do
    agent.name = Time.now.usec.to_s
    expect(agent.save).to eq(true)
  end

  it 'updates its self' do
    agent.name = Time.now.usec.to_s
    expect(agent.save).to eq(true)
    agent.name = Time.now.usec.to_s
    expect(agent.save).to eq(true)
  end

  it 'deletes its self' do
    expect(agent.destroy).to eq(true)
  end
end

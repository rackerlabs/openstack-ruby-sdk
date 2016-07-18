require 'spec_helper'

describe OpenStackRubySDK::Trove::Configuration, :vcr do
  let(:configuration){ OpenStackRubySDK::Trove::Configuration.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Trove::Configuration.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Trove::Configuration.find(configuration.id)).to eq(configuration)
  end

  it 'creates its self' do
    configuration.name = Time.now.usec.to_s
    expect(configuration.save).to eq(true)
  end

  it 'updates its self' do
    configuration.name = Time.now.usec.to_s
    expect(configuration.save).to eq(true)
    configuration.name = Time.now.usec.to_s
    expect(configuration.save).to eq(true)
  end

  it 'deletes its self' do
    expect(configuration.destroy).to eq(true)
  end
end

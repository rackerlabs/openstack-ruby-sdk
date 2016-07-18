require 'spec_helper'

describe OpenStackRubySDK::Trove::ConfigurationParameter, :vcr do
  let(:configuration_parameter){ OpenStackRubySDK::Trove::ConfigurationParameter.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Trove::ConfigurationParameter.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Trove::ConfigurationParameter.find(configuration_parameter.id)).to eq(configuration_parameter)
  end

  it 'creates its self' do
    configuration_parameter.name = Time.now.usec.to_s
    expect(configuration_parameter.save).to eq(true)
  end

  it 'updates its self' do
    configuration_parameter.name = Time.now.usec.to_s
    expect(configuration_parameter.save).to eq(true)
    configuration_parameter.name = Time.now.usec.to_s
    expect(configuration_parameter.save).to eq(true)
  end

  it 'deletes its self' do
    expect(configuration_parameter.destroy).to eq(true)
  end
end

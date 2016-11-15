require 'spec_helper'

describe OpenStackRubySDK::Heat::SoftwareConfiguration do
  let(:software_configuration){ OpenStackRubySDK::Heat::SoftwareConfiguration.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Heat::SoftwareConfiguration.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Heat::SoftwareConfiguration.find(software_configuration.id)).to eq(software_configuration)
  end

  it 'creates its self' do
    software_configuration.name = Time.now.usec.to_s
    expect(software_configuration.save).to eq(true)
  end

  it 'updates its self' do
    software_configuration.name = Time.now.usec.to_s
    expect(software_configuration.save).to eq(true)
    software_configuration.name = Time.now.usec.to_s
    expect(software_configuration.save).to eq(true)
  end

  it 'deletes its self' do
    expect(software_configuration.destroy).to eq(true)
  end
end

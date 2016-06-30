require 'spec_helper'

describe OpenStackRubySDK::Raksha::RestoreConfiguration, :vcr do
  let(:restore_configuration){ OpenStackRubySDK::Raksha::RestoreConfiguration.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Raksha::RestoreConfiguration.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Raksha::RestoreConfiguration.find(restore_configuration.id)).to eq(restore_configuration)
  end

  it 'creates its self' do
    restore_configuration.name = Time.now.usec.to_s
    expect(restore_configuration.save).to eq(true)
  end

  it 'updates its self' do
    restore_configuration.name = Time.now.usec.to_s
    expect(restore_configuration.save).to eq(true)
    restore_configuration.name = Time.now.usec.to_s
    expect(restore_configuration.save).to eq(true)
  end

  it 'deletes its self' do
    expect(restore_configuration.destroy).to eq(true)
  end
end

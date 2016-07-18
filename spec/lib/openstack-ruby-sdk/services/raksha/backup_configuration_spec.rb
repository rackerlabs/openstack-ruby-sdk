require 'spec_helper'

describe OpenStackRubySDK::Raksha::BackupConfiguration, :vcr do
  let(:backup_configuration){ OpenStackRubySDK::Raksha::BackupConfiguration.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Raksha::BackupConfiguration.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Raksha::BackupConfiguration.find(backup_configuration.id)).to eq(backup_configuration)
  end

  it 'creates its self' do
    backup_configuration.name = Time.now.usec.to_s
    expect(backup_configuration.save).to eq(true)
  end

  it 'updates its self' do
    backup_configuration.name = Time.now.usec.to_s
    expect(backup_configuration.save).to eq(true)
    backup_configuration.name = Time.now.usec.to_s
    expect(backup_configuration.save).to eq(true)
  end

  it 'deletes its self' do
    expect(backup_configuration.destroy).to eq(true)
  end
end

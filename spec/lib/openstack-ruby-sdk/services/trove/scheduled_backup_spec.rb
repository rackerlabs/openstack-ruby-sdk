require 'spec_helper'

describe OpenStackRubySDK::Trove::ScheduledBackup, :vcr do
  let(:scheduled_backup){ OpenStackRubySDK::Trove::ScheduledBackup.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Trove::ScheduledBackup.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Trove::ScheduledBackup.find(scheduled_backup.id)).to eq(scheduled_backup)
  end

  it 'creates its self' do
    scheduled_backup.name = Time.now.usec.to_s
    expect(scheduled_backup.save).to eq(true)
  end

  it 'updates its self' do
    scheduled_backup.name = Time.now.usec.to_s
    expect(scheduled_backup.save).to eq(true)
    scheduled_backup.name = Time.now.usec.to_s
    expect(scheduled_backup.save).to eq(true)
  end

  it 'deletes its self' do
    expect(scheduled_backup.destroy).to eq(true)
  end
end

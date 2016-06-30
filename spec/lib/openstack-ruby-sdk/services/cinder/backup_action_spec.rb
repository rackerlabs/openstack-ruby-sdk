require 'spec_helper'

describe OpenStackRubySDK::Cinder::BackupAction, :vcr do
  let(:backup_action){ OpenStackRubySDK::Cinder::BackupAction.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::BackupAction.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::BackupAction.find(backup_action.id)).to eq(backup_action)
  end

  it 'creates its self' do
    backup_action.name = Time.now.usec.to_s
    expect(backup_action.save).to eq(true)
  end

  it 'updates its self' do
    backup_action.name = Time.now.usec.to_s
    expect(backup_action.save).to eq(true)
    backup_action.name = Time.now.usec.to_s
    expect(backup_action.save).to eq(true)
  end

  it 'deletes its self' do
    expect(backup_action.destroy).to eq(true)
  end
end

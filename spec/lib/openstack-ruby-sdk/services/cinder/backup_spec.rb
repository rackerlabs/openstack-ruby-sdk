require 'spec_helper'

describe OpenStackRubySDK::Cinder::Backup, :vcr do
  let(:backup){ OpenStackRubySDK::Cinder::Backup.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::Backup.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::Backup.find(backup.id)).to eq(backup)
  end

  it 'creates its self' do
    backup.name = Time.now.usec.to_s
    expect(backup.save).to eq(true)
  end

  it 'updates its self' do
    backup.name = Time.now.usec.to_s
    expect(backup.save).to eq(true)
    backup.name = Time.now.usec.to_s
    expect(backup.save).to eq(true)
  end

  it 'deletes its self' do
    expect(backup.destroy).to eq(true)
  end
end

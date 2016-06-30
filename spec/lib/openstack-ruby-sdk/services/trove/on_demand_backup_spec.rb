require 'spec_helper'

describe OpenStackRubySDK::Trove::OnDemandBackup, :vcr do
  let(:on_demand_backup){ OpenStackRubySDK::Trove::OnDemandBackup.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Trove::OnDemandBackup.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Trove::OnDemandBackup.find(on_demand_backup.id)).to eq(on_demand_backup)
  end

  it 'creates its self' do
    on_demand_backup.name = Time.now.usec.to_s
    expect(on_demand_backup.save).to eq(true)
  end

  it 'updates its self' do
    on_demand_backup.name = Time.now.usec.to_s
    expect(on_demand_backup.save).to eq(true)
    on_demand_backup.name = Time.now.usec.to_s
    expect(on_demand_backup.save).to eq(true)
  end

  it 'deletes its self' do
    expect(on_demand_backup.destroy).to eq(true)
  end
end

require 'spec_helper'

describe OpenStackRubySDK::Cinder::ConsistencyGroupSnapshot, :vcr do
  let(:consistency_group_snapshot){ OpenStackRubySDK::Cinder::ConsistencyGroupSnapshot.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::ConsistencyGroupSnapshot.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::ConsistencyGroupSnapshot.find(consistency_group_snapshot.id)).to eq(consistency_group_snapshot)
  end

  it 'creates its self' do
    consistency_group_snapshot.name = Time.now.usec.to_s
    expect(consistency_group_snapshot.save).to eq(true)
  end

  it 'updates its self' do
    consistency_group_snapshot.name = Time.now.usec.to_s
    expect(consistency_group_snapshot.save).to eq(true)
    consistency_group_snapshot.name = Time.now.usec.to_s
    expect(consistency_group_snapshot.save).to eq(true)
  end

  it 'deletes its self' do
    expect(consistency_group_snapshot.destroy).to eq(true)
  end
end

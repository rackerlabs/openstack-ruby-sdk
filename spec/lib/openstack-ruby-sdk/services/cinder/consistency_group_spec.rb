require 'spec_helper'

describe OpenStackRubySDK::Cinder::ConsistencyGroup, :vcr do
  let(:consistency_group){ OpenStackRubySDK::Cinder::ConsistencyGroup.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::ConsistencyGroup.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::ConsistencyGroup.find(consistency_group.id)).to eq(consistency_group)
  end

  it 'creates its self' do
    consistency_group.name = Time.now.usec.to_s
    expect(consistency_group.save).to eq(true)
  end

  it 'updates its self' do
    consistency_group.name = Time.now.usec.to_s
    expect(consistency_group.save).to eq(true)
    consistency_group.name = Time.now.usec.to_s
    expect(consistency_group.save).to eq(true)
  end

  it 'deletes its self' do
    expect(consistency_group.destroy).to eq(true)
  end
end

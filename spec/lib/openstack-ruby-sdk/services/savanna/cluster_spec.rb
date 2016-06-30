require 'spec_helper'

describe OpenStackRubySDK::Savanna::Cluster, :vcr do
  let(:cluster){ OpenStackRubySDK::Savanna::Cluster.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Savanna::Cluster.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Savanna::Cluster.find(cluster.id)).to eq(cluster)
  end

  it 'creates its self' do
    cluster.name = Time.now.usec.to_s
    expect(cluster.save).to eq(true)
  end

  it 'updates its self' do
    cluster.name = Time.now.usec.to_s
    expect(cluster.save).to eq(true)
    cluster.name = Time.now.usec.to_s
    expect(cluster.save).to eq(true)
  end

  it 'deletes its self' do
    expect(cluster.destroy).to eq(true)
  end
end

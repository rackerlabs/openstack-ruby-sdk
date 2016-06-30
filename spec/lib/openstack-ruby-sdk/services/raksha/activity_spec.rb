require 'spec_helper'

describe OpenStackRubySDK::Raksha::Activity, :vcr do
  let(:activity){ OpenStackRubySDK::Raksha::Activity.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Raksha::Activity.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Raksha::Activity.find(activity.id)).to eq(activity)
  end

  it 'creates its self' do
    activity.name = Time.now.usec.to_s
    expect(activity.save).to eq(true)
  end

  it 'updates its self' do
    activity.name = Time.now.usec.to_s
    expect(activity.save).to eq(true)
    activity.name = Time.now.usec.to_s
    expect(activity.save).to eq(true)
  end

  it 'deletes its self' do
    expect(activity.destroy).to eq(true)
  end
end

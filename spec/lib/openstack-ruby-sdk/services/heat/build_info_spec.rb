require 'spec_helper'

describe OpenStackRubySDK::Heat::BuildInfo, :vcr do
  let(:build_info){ OpenStackRubySDK::Heat::BuildInfo.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Heat::BuildInfo.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Heat::BuildInfo.find(build_info.id)).to eq(build_info)
  end

  it 'creates its self' do
    build_info.name = Time.now.usec.to_s
    expect(build_info.save).to eq(true)
  end

  it 'updates its self' do
    build_info.name = Time.now.usec.to_s
    expect(build_info.save).to eq(true)
    build_info.name = Time.now.usec.to_s
    expect(build_info.save).to eq(true)
  end

  it 'deletes its self' do
    expect(build_info.destroy).to eq(true)
  end
end

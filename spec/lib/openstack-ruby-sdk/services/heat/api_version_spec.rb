require 'spec_helper'

describe OpenStackRubySDK::Heat::ApiVersion do
  let(:api_version){ OpenStackRubySDK::Heat::ApiVersion.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Heat::ApiVersion.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Heat::ApiVersion.find(api_version.id)).to eq(api_version)
  end

  it 'creates its self' do
    api_version.name = Time.now.usec.to_s
    expect(api_version.save).to eq(true)
  end

  it 'updates its self' do
    api_version.name = Time.now.usec.to_s
    expect(api_version.save).to eq(true)
    api_version.name = Time.now.usec.to_s
    expect(api_version.save).to eq(true)
  end

  it 'deletes its self' do
    expect(api_version.destroy).to eq(true)
  end
end

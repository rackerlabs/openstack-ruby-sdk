require 'spec_helper'

describe OpenStackRubySDK::Cinder::ApiExtension, :vcr do
  let(:api_extension){ OpenStackRubySDK::Cinder::ApiExtension.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::ApiExtension.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::ApiExtension.find(api_extension.id)).to eq(api_extension)
  end

  it 'creates its self' do
    api_extension.name = Time.now.usec.to_s
    expect(api_extension.save).to eq(true)
  end

  it 'updates its self' do
    api_extension.name = Time.now.usec.to_s
    expect(api_extension.save).to eq(true)
    api_extension.name = Time.now.usec.to_s
    expect(api_extension.save).to eq(true)
  end

  it 'deletes its self' do
    expect(api_extension.destroy).to eq(true)
  end
end

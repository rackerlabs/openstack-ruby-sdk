require 'spec_helper'

describe OpenStackRubySDK::Cinder::QuotaSetsExtension, :vcr do
  let(:quota_sets_extension){ OpenStackRubySDK::Cinder::QuotaSetsExtension.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::QuotaSetsExtension.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::QuotaSetsExtension.find(quota_sets_extension.id)).to eq(quota_sets_extension)
  end

  it 'creates its self' do
    quota_sets_extension.name = Time.now.usec.to_s
    expect(quota_sets_extension.save).to eq(true)
  end

  it 'updates its self' do
    quota_sets_extension.name = Time.now.usec.to_s
    expect(quota_sets_extension.save).to eq(true)
    quota_sets_extension.name = Time.now.usec.to_s
    expect(quota_sets_extension.save).to eq(true)
  end

  it 'deletes its self' do
    expect(quota_sets_extension.destroy).to eq(true)
  end
end

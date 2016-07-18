require 'spec_helper'

describe OpenStackRubySDK::Nova::Misc, :vcr do

  it 'gets rate and absolute limits' do
    limits = OpenStackRubySDK::Nova::Misc.limits
    expect(limits['limits']['absolute']['maxServerMeta']).to be_present
    expect(limits['limits']['absolute']['maxPersonality']).to be_present
    expect(limits['limits']['absolute']['maxImageMeta']).to be_present
  end

  it 'gets quotas' do
    quotas = OpenStackRubySDK::Nova::Misc.quotas
    expect(quotas['quota_set']['metadata_items']).to be_present
    expect(quotas['quota_set']['server_groups']).to be_present
    expect(quotas['quota_set']['ram']).to be_present
  end

  it 'gets extensions' do
    extensions = OpenStackRubySDK::Nova::Misc.extensions
    expect(extensions['extensions'].count).to be > 0
  end

end

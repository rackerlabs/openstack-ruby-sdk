require 'spec_helper'

describe OpenStackRubySDK::Cinder::VolumeType, :vcr do
  let(:volume_type){ OpenStackRubySDK::Cinder::VolumeType.first }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::VolumeType.all.count).to be >= 0
  end

  it 'grants access to a project' do
    expect(volume_type.grant_access!(PROJECT_ID)).to eq(true)
  end

  it 'removes access to a project' do
    expect(volume_type.grant_access!(PROJECT_ID)).to eq(true)
    expect(volume_type.revoke_access!(PROJECT_ID)).to eq(true)
  end

  it 'has details' do
  end

end

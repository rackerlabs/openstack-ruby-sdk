require 'spec_helper'

describe OpenStackRubySDK::Cinder::Limit, :vcr do
  it 'gets a list' do
    limits = OpenStackRubySDK::Cinder::Limit.all
    expect(limits["limits"]["absolute"]["totalSnapshotsUsed"]).to be >= 0
    expect(limits["limits"]["absolute"]["maxTotalBackups"]).to be >= 0
    expect(limits["limits"]["absolute"]["totalVolumesUsed"]).to be >= 0
  end
end

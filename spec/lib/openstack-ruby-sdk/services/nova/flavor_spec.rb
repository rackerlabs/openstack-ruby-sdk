require 'spec_helper'

describe OpenStackRubySDK::Nova::Flavor, :vcr do
  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::Flavor.all.count).to be >= 0
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Nova::Flavor.find(1)).to be_present
  end

  it 'gets details' do
    f = OpenStackRubySDK::Nova::Flavor.find(1)
    expect(f.details.ram).to be_present
    expect(f.details.vcpus).to be_present
  end
end

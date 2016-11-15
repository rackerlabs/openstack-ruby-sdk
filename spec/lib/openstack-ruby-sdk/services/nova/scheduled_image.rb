require 'spec_helper'

describe OpenStackRubySDK::Nova::ScheduledImage do
  let(:image){ OpenStackRubySDK::Nova::ScheduledImage.first }
  
  before do
    skip 'Rackspace only'
  end

  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::ScheduledImage.all.count).to be > 0
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Nova::ScheduledImage.find(image.id).id).to eq(image.id)
  end

  it 'deletes its self' do
    expect(image.destroy).to eq(true)
  end

  it 'gets details' do
    image.reload
    expect(image.minDisk).to be_present
    expect(image.size).to be_present
    expect(image.state).to be_present
  end

  it 'can enable scheduled images'
  it 'can disable scheduled images'
  it 'can list scheduled images'
end

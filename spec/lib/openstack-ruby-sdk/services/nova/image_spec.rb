require 'spec_helper'

describe OpenStackRubySDK::Nova::Image do
  let(:image){ OpenStackRubySDK::Nova::Image.first }

  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::Image.all.count).to be > 0
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Nova::Image.find(image.id).id).to eq(image.id)
  end

  it 'gets details' do
    image.reload
    expect(image.minDisk).to be_present
    expect(image.size).to be_present
    expect(image.state).to be_present
  end

  it 'has metadata' do
    expect(image.metadata).to eq(nil)
  end

  it 'can save metadata' do
    image.set_metadata({some: 'value'})
    expect(image.metadata).to eq({'some' => 'value'})
  end

  # TODO: Move these to a ScheduleImage resource. It is RAX only.
  it 'can enable scheduled images'
  it 'can disable scheduled images'
  it 'can list scheduled images'

  it 'deletes its self' do
    # expect(image.destroy).to eq(true)
  end

end

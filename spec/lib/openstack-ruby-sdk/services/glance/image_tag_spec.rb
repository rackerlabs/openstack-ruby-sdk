require 'spec_helper'

describe OpenStackRubySDK::Glance::ImageTag, :vcr do
  let(:image_tag){ OpenStackRubySDK::Glance::ImageTag.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Glance::ImageTag.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Glance::ImageTag.find(image_tag.id)).to eq(image_tag)
  end

  it 'creates its self' do
    image_tag.name = Time.now.usec.to_s
    expect(image_tag.save).to eq(true)
  end

  it 'updates its self' do
    image_tag.name = Time.now.usec.to_s
    expect(image_tag.save).to eq(true)
    image_tag.name = Time.now.usec.to_s
    expect(image_tag.save).to eq(true)
  end

  it 'deletes its self' do
    expect(image_tag.destroy).to eq(true)
  end
end

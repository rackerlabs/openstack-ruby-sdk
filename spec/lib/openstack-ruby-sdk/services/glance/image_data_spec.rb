require 'spec_helper'

describe OpenStackRubySDK::Glance::ImageData, :vcr do
  let(:image_data){ OpenStackRubySDK::Glance::ImageData.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Glance::ImageData.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Glance::ImageData.find(image_data.id)).to eq(image_data)
  end

  it 'creates its self' do
    image_data.name = Time.now.usec.to_s
    expect(image_data.save).to eq(true)
  end

  it 'updates its self' do
    image_data.name = Time.now.usec.to_s
    expect(image_data.save).to eq(true)
    image_data.name = Time.now.usec.to_s
    expect(image_data.save).to eq(true)
  end

  it 'deletes its self' do
    expect(image_data.destroy).to eq(true)
  end
end

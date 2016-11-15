require 'spec_helper'

describe OpenStackRubySDK::Glance::ImageSchema do
  let(:image_schema){ OpenStackRubySDK::Glance::ImageSchema.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Glance::ImageSchema.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Glance::ImageSchema.find(image_schema.id)).to eq(image_schema)
  end

  it 'creates its self' do
    image_schema.name = Time.now.usec.to_s
    expect(image_schema.save).to eq(true)
  end

  it 'updates its self' do
    image_schema.name = Time.now.usec.to_s
    expect(image_schema.save).to eq(true)
    image_schema.name = Time.now.usec.to_s
    expect(image_schema.save).to eq(true)
  end

  it 'deletes its self' do
    expect(image_schema.destroy).to eq(true)
  end
end

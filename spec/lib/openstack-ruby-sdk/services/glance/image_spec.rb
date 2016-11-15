require 'spec_helper'

describe OpenStackRubySDK::Glance::Image do
  let(:image){ OpenStackRubySDK::Glance::Image.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Glance::Image.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Glance::Image.find(image.id)).to eq(image)
  end

  it 'creates its self' do
    image.name = Time.now.usec.to_s
    expect(image.save).to eq(true)
  end

  it 'updates its self' do
    image.name = Time.now.usec.to_s
    expect(image.save).to eq(true)
    image.name = Time.now.usec.to_s
    expect(image.save).to eq(true)
  end

  it 'deletes its self' do
    expect(image.destroy).to eq(true)
  end
end

require 'spec_helper'

describe OpenStackRubySDK::Cinder::QualityOfService, :vcr do
  let(:quality_of_service){ OpenStackRubySDK::Cinder::QualityOfService.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::QualityOfService.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Cinder::QualityOfService.find(quality_of_service.id)).to eq(quality_of_service)
  end

  it 'creates its self' do
    quality_of_service.name = Time.now.usec.to_s
    expect(quality_of_service.save).to eq(true)
  end

  it 'updates its self' do
    quality_of_service.name = Time.now.usec.to_s
    expect(quality_of_service.save).to eq(true)
    quality_of_service.name = Time.now.usec.to_s
    expect(quality_of_service.save).to eq(true)
  end

  it 'deletes its self' do
    expect(quality_of_service.destroy).to eq(true)
  end
end

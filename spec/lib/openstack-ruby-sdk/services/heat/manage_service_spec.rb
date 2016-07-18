require 'spec_helper'

describe OpenStackRubySDK::Heat::ManageService, :vcr do
  let(:manage_service){ OpenStackRubySDK::Heat::ManageService.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Heat::ManageService.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Heat::ManageService.find(manage_service.id)).to eq(manage_service)
  end

  it 'creates its self' do
    manage_service.name = Time.now.usec.to_s
    expect(manage_service.save).to eq(true)
  end

  it 'updates its self' do
    manage_service.name = Time.now.usec.to_s
    expect(manage_service.save).to eq(true)
    manage_service.name = Time.now.usec.to_s
    expect(manage_service.save).to eq(true)
  end

  it 'deletes its self' do
    expect(manage_service.destroy).to eq(true)
  end
end

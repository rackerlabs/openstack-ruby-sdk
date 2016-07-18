require 'spec_helper'

describe OpenStackRubySDK::Savanna::Distro, :vcr do
  let(:distro){ OpenStackRubySDK::Savanna::Distro.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Savanna::Distro.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Savanna::Distro.find(distro.id)).to eq(distro)
  end

  it 'creates its self' do
    distro.name = Time.now.usec.to_s
    expect(distro.save).to eq(true)
  end

  it 'updates its self' do
    distro.name = Time.now.usec.to_s
    expect(distro.save).to eq(true)
    distro.name = Time.now.usec.to_s
    expect(distro.save).to eq(true)
  end

  it 'deletes its self' do
    expect(distro.destroy).to eq(true)
  end
end

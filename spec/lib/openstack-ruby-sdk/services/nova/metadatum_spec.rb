require 'spec_helper'

describe OpenStackRubySDK::Nova::Metadatum, :vcr do
  let(:metadatum){ OpenStackRubySDK::Nova::Metadatum.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::Metadatum.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Nova::Metadatum.find(metadatum.id)).to eq(metadatum)
  end

  it 'creates its self' do
    metadatum.name = Time.now.usec.to_s
    expect(metadatum.save).to eq(true)
  end

  it 'updates its self' do
    metadatum.name = Time.now.usec.to_s
    expect(metadatum.save).to eq(true)
    metadatum.name = Time.now.usec.to_s
    expect(metadatum.save).to eq(true)
  end

  it 'deletes its self' do
    expect(metadatum.destroy).to eq(true)
  end
end

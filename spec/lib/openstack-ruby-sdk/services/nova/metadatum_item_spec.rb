require 'spec_helper'

describe OpenStackRubySDK::Nova::MetadatumItem, :vcr do
  let(:metadatum_item){ OpenStackRubySDK::Nova::MetadatumItem.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::MetadatumItem.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Nova::MetadatumItem.find(metadatum_item.id)).to eq(metadatum_item)
  end

  it 'creates its self' do
    metadatum_item.name = Time.now.usec.to_s
    expect(metadatum_item.save).to eq(true)
  end

  it 'updates its self' do
    metadatum_item.name = Time.now.usec.to_s
    expect(metadatum_item.save).to eq(true)
    metadatum_item.name = Time.now.usec.to_s
    expect(metadatum_item.save).to eq(true)
  end

  it 'deletes its self' do
    expect(metadatum_item.destroy).to eq(true)
  end
end

require 'spec_helper'

describe OpenStackRubySDK::Glance::MetadataDefinitionObject, :vcr do
  let(:metadata_definition_object){ OpenStackRubySDK::Glance::MetadataDefinitionObject.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Glance::MetadataDefinitionObject.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Glance::MetadataDefinitionObject.find(metadata_definition_object.id)).to eq(metadata_definition_object)
  end

  it 'creates its self' do
    metadata_definition_object.name = Time.now.usec.to_s
    expect(metadata_definition_object.save).to eq(true)
  end

  it 'updates its self' do
    metadata_definition_object.name = Time.now.usec.to_s
    expect(metadata_definition_object.save).to eq(true)
    metadata_definition_object.name = Time.now.usec.to_s
    expect(metadata_definition_object.save).to eq(true)
  end

  it 'deletes its self' do
    expect(metadata_definition_object.destroy).to eq(true)
  end
end

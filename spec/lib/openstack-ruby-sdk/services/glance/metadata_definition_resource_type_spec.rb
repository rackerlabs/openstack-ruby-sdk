require 'spec_helper'

describe OpenStackRubySDK::Glance::MetadataDefinitionResourceType, :vcr do
  let(:metadata_definition_resource_type){ OpenStackRubySDK::Glance::MetadataDefinitionResourceType.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Glance::MetadataDefinitionResourceType.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Glance::MetadataDefinitionResourceType.find(metadata_definition_resource_type.id)).to eq(metadata_definition_resource_type)
  end

  it 'creates its self' do
    metadata_definition_resource_type.name = Time.now.usec.to_s
    expect(metadata_definition_resource_type.save).to eq(true)
  end

  it 'updates its self' do
    metadata_definition_resource_type.name = Time.now.usec.to_s
    expect(metadata_definition_resource_type.save).to eq(true)
    metadata_definition_resource_type.name = Time.now.usec.to_s
    expect(metadata_definition_resource_type.save).to eq(true)
  end

  it 'deletes its self' do
    expect(metadata_definition_resource_type.destroy).to eq(true)
  end
end

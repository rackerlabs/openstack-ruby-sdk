require 'spec_helper'

describe OpenStackRubySDK::Glance::MetadataDefinitionProperty, :vcr do
  let(:metadata_definition_property){ OpenStackRubySDK::Glance::MetadataDefinitionProperty.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Glance::MetadataDefinitionProperty.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Glance::MetadataDefinitionProperty.find(metadata_definition_property.id)).to eq(metadata_definition_property)
  end

  it 'creates its self' do
    metadata_definition_property.name = Time.now.usec.to_s
    expect(metadata_definition_property.save).to eq(true)
  end

  it 'updates its self' do
    metadata_definition_property.name = Time.now.usec.to_s
    expect(metadata_definition_property.save).to eq(true)
    metadata_definition_property.name = Time.now.usec.to_s
    expect(metadata_definition_property.save).to eq(true)
  end

  it 'deletes its self' do
    expect(metadata_definition_property.destroy).to eq(true)
  end
end

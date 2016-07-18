require 'spec_helper'

describe OpenStackRubySDK::Glance::MetadataDefinitionSchema, :vcr do
  let(:metadata_definition_schema){ OpenStackRubySDK::Glance::MetadataDefinitionSchema.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Glance::MetadataDefinitionSchema.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Glance::MetadataDefinitionSchema.find(metadata_definition_schema.id)).to eq(metadata_definition_schema)
  end

  it 'creates its self' do
    metadata_definition_schema.name = Time.now.usec.to_s
    expect(metadata_definition_schema.save).to eq(true)
  end

  it 'updates its self' do
    metadata_definition_schema.name = Time.now.usec.to_s
    expect(metadata_definition_schema.save).to eq(true)
    metadata_definition_schema.name = Time.now.usec.to_s
    expect(metadata_definition_schema.save).to eq(true)
  end

  it 'deletes its self' do
    expect(metadata_definition_schema.destroy).to eq(true)
  end
end

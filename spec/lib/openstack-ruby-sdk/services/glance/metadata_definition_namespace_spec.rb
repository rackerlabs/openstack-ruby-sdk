require 'spec_helper'

describe OpenStackRubySDK::Glance::MetadataDefinitionNamespace, :vcr do
  let(:metadata_definition_namespace){ OpenStackRubySDK::Glance::MetadataDefinitionNamespace.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Glance::MetadataDefinitionNamespace.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Glance::MetadataDefinitionNamespace.find(metadata_definition_namespace.id)).to eq(metadata_definition_namespace)
  end

  it 'creates its self' do
    metadata_definition_namespace.name = Time.now.usec.to_s
    expect(metadata_definition_namespace.save).to eq(true)
  end

  it 'updates its self' do
    metadata_definition_namespace.name = Time.now.usec.to_s
    expect(metadata_definition_namespace.save).to eq(true)
    metadata_definition_namespace.name = Time.now.usec.to_s
    expect(metadata_definition_namespace.save).to eq(true)
  end

  it 'deletes its self' do
    expect(metadata_definition_namespace.destroy).to eq(true)
  end
end

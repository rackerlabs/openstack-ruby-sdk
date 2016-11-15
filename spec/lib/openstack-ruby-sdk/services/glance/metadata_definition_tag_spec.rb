require 'spec_helper'

describe OpenStackRubySDK::Glance::MetadataDefinitionTag do
  let(:metadata_definition_tag){ OpenStackRubySDK::Glance::MetadataDefinitionTag.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Glance::MetadataDefinitionTag.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Glance::MetadataDefinitionTag.find(metadata_definition_tag.id)).to eq(metadata_definition_tag)
  end

  it 'creates its self' do
    metadata_definition_tag.name = Time.now.usec.to_s
    expect(metadata_definition_tag.save).to eq(true)
  end

  it 'updates its self' do
    metadata_definition_tag.name = Time.now.usec.to_s
    expect(metadata_definition_tag.save).to eq(true)
    metadata_definition_tag.name = Time.now.usec.to_s
    expect(metadata_definition_tag.save).to eq(true)
  end

  it 'deletes its self' do
    expect(metadata_definition_tag.destroy).to eq(true)
  end
end

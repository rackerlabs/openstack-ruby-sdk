require 'spec_helper'

describe OpenStackRubySDK::Ceilometer::TraitDescription do
  let(:trait_description){ OpenStackRubySDK::Ceilometer::TraitDescription.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Ceilometer::TraitDescription.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Ceilometer::TraitDescription.find(trait_description.id)).to eq(trait_description)
  end

  it 'creates its self' do
    trait_description.name = Time.now.usec.to_s
    expect(trait_description.save).to eq(true)
  end

  it 'updates its self' do
    trait_description.name = Time.now.usec.to_s
    expect(trait_description.save).to eq(true)
    trait_description.name = Time.now.usec.to_s
    expect(trait_description.save).to eq(true)
  end

  it 'deletes its self' do
    expect(trait_description.destroy).to eq(true)
  end
end

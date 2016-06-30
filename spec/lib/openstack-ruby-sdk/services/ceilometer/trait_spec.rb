require 'spec_helper'

describe OpenStackRubySDK::Ceilometer::Trait, :vcr do
  let(:trait){ OpenStackRubySDK::Ceilometer::Trait.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Ceilometer::Trait.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Ceilometer::Trait.find(trait.id)).to eq(trait)
  end

  it 'creates its self' do
    trait.name = Time.now.usec.to_s
    expect(trait.save).to eq(true)
  end

  it 'updates its self' do
    trait.name = Time.now.usec.to_s
    expect(trait.save).to eq(true)
    trait.name = Time.now.usec.to_s
    expect(trait.save).to eq(true)
  end

  it 'deletes its self' do
    expect(trait.destroy).to eq(true)
  end
end

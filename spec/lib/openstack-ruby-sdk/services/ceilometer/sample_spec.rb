require 'spec_helper'

describe OpenStackRubySDK::Ceilometer::Sample do
  let(:sample){ OpenStackRubySDK::Ceilometer::Sample.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Ceilometer::Sample.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Ceilometer::Sample.find(sample.id)).to eq(sample)
  end

  it 'creates its self' do
    sample.name = Time.now.usec.to_s
    expect(sample.save).to eq(true)
  end

  it 'updates its self' do
    sample.name = Time.now.usec.to_s
    expect(sample.save).to eq(true)
    sample.name = Time.now.usec.to_s
    expect(sample.save).to eq(true)
  end

  it 'deletes its self' do
    expect(sample.destroy).to eq(true)
  end
end

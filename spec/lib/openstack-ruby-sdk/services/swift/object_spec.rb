require 'spec_helper'

describe OpenStackRubySDK::Swift::Object do
  let(:object){ OpenStackRubySDK::Swift::Object.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Swift::Object.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Swift::Object.find(object.id)).to eq(object)
  end

  it 'creates its self' do
    object.name = Time.now.usec.to_s
    expect(object.save).to eq(true)
  end

  it 'updates its self' do
    object.name = Time.now.usec.to_s
    expect(object.save).to eq(true)
    object.name = Time.now.usec.to_s
    expect(object.save).to eq(true)
  end

  it 'deletes its self' do
    expect(object.destroy).to eq(true)
  end
end

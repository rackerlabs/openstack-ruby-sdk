require 'spec_helper'

describe OpenStackRubySDK::Heat::Template do
  let(:template){ OpenStackRubySDK::Heat::Template.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Heat::Template.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Heat::Template.find(template.id)).to eq(template)
  end

  it 'creates its self' do
    template.name = Time.now.usec.to_s
    expect(template.save).to eq(true)
  end

  it 'updates its self' do
    template.name = Time.now.usec.to_s
    expect(template.save).to eq(true)
    template.name = Time.now.usec.to_s
    expect(template.save).to eq(true)
  end

  it 'deletes its self' do
    expect(template.destroy).to eq(true)
  end
end

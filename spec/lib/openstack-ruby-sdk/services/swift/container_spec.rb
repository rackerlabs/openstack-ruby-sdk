require 'spec_helper'

describe OpenStackRubySDK::Swift::Container, :vcr do
  let(:container){ OpenStackRubySDK::Swift::Container.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Swift::Container.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Swift::Container.find(container.id)).to eq(container)
  end

  it 'creates its self' do
    container.name = Time.now.usec.to_s
    expect(container.save).to eq(true)
  end

  it 'updates its self' do
    container.name = Time.now.usec.to_s
    expect(container.save).to eq(true)
    container.name = Time.now.usec.to_s
    expect(container.save).to eq(true)
  end

  it 'deletes its self' do
    expect(container.destroy).to eq(true)
  end
end

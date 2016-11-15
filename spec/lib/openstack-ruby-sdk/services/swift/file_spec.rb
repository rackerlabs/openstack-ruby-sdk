require 'spec_helper'

describe OpenStackRubySDK::Swift::File do
  let(:file){ OpenStackRubySDK::Swift::File.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Swift::File.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Swift::File.find(file.id)).to eq(file)
  end

  it 'creates its self' do
    file.name = Time.now.usec.to_s
    expect(file.save).to eq(true)
  end

  it 'updates its self' do
    file.name = Time.now.usec.to_s
    expect(file.save).to eq(true)
    file.name = Time.now.usec.to_s
    expect(file.save).to eq(true)
  end

  it 'deletes its self' do
    expect(file.destroy).to eq(true)
  end
end

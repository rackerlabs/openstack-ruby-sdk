require 'spec_helper'

describe OpenStackRubySDK::Raksha::Restore, :vcr do
  let(:restore){ OpenStackRubySDK::Raksha::Restore.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Raksha::Restore.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Raksha::Restore.find(restore.id)).to eq(restore)
  end

  it 'creates its self' do
    restore.name = Time.now.usec.to_s
    expect(restore.save).to eq(true)
  end

  it 'updates its self' do
    restore.name = Time.now.usec.to_s
    expect(restore.save).to eq(true)
    restore.name = Time.now.usec.to_s
    expect(restore.save).to eq(true)
  end

  it 'deletes its self' do
    expect(restore.destroy).to eq(true)
  end
end

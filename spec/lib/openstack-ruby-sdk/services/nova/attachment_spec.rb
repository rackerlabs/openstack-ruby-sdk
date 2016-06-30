require 'spec_helper'

describe OpenStackRubySDK::Nova::Attachment, :vcr do
  let(:attachment){ OpenStackRubySDK::Nova::Attachment.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::Attachment.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Nova::Attachment.find(attachment.id)).to eq(attachment)
  end

  it 'creates its self' do
    attachment.name = Time.now.usec.to_s
    expect(attachment.save).to eq(true)
  end

  it 'updates its self' do
    attachment.name = Time.now.usec.to_s
    expect(attachment.save).to eq(true)
    attachment.name = Time.now.usec.to_s
    expect(attachment.save).to eq(true)
  end

  it 'deletes its self' do
    expect(attachment.destroy).to eq(true)
  end
end

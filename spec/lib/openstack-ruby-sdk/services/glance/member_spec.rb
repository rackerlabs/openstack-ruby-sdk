require 'spec_helper'

describe OpenStackRubySDK::Glance::Member, :vcr do
  let(:member){ OpenStackRubySDK::Glance::Member.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Glance::Member.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Glance::Member.find(member.id)).to eq(member)
  end

  it 'creates its self' do
    member.name = Time.now.usec.to_s
    expect(member.save).to eq(true)
  end

  it 'updates its self' do
    member.name = Time.now.usec.to_s
    expect(member.save).to eq(true)
    member.name = Time.now.usec.to_s
    expect(member.save).to eq(true)
  end

  it 'deletes its self' do
    expect(member.destroy).to eq(true)
  end
end

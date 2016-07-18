require 'spec_helper'

describe OpenStackRubySDK::Keystone::Project, :vcr do
  let(:project){ OpenStackRubySDK::Keystone::Project.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Keystone::Project.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Keystone::Project.find(project.id)).to eq(project)
  end

  it 'creates its self' do
    project.name = Time.now.usec.to_s
    expect(project.save).to eq(true)
  end

  it 'updates its self' do
    project.name = Time.now.usec.to_s
    expect(project.save).to eq(true)
    project.name = Time.now.usec.to_s
    expect(project.save).to eq(true)
  end

  it 'deletes its self' do
    expect(project.destroy).to eq(true)
  end
end

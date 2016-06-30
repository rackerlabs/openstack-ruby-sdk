require 'spec_helper'

describe OpenStackRubySDK::Keystone::DomainConfiguration, :vcr do
  let(:domain_configuration){ OpenStackRubySDK::Keystone::DomainConfiguration.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Keystone::DomainConfiguration.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Keystone::DomainConfiguration.find(domain_configuration.id)).to eq(domain_configuration)
  end

  it 'creates its self' do
    domain_configuration.name = Time.now.usec.to_s
    expect(domain_configuration.save).to eq(true)
  end

  it 'updates its self' do
    domain_configuration.name = Time.now.usec.to_s
    expect(domain_configuration.save).to eq(true)
    domain_configuration.name = Time.now.usec.to_s
    expect(domain_configuration.save).to eq(true)
  end

  it 'deletes its self' do
    expect(domain_configuration.destroy).to eq(true)
  end
end

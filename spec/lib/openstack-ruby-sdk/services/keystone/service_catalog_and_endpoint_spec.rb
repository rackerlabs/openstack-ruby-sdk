require 'spec_helper'

describe OpenStackRubySDK::Keystone::ServiceCatalogAndEndpoint, :vcr do
  let(:service_catalog_and_endpoint){ OpenStackRubySDK::Keystone::ServiceCatalogAndEndpoint.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Keystone::ServiceCatalogAndEndpoint.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Keystone::ServiceCatalogAndEndpoint.find(service_catalog_and_endpoint.id)).to eq(service_catalog_and_endpoint)
  end

  it 'creates its self' do
    service_catalog_and_endpoint.name = Time.now.usec.to_s
    expect(service_catalog_and_endpoint.save).to eq(true)
  end

  it 'updates its self' do
    service_catalog_and_endpoint.name = Time.now.usec.to_s
    expect(service_catalog_and_endpoint.save).to eq(true)
    service_catalog_and_endpoint.name = Time.now.usec.to_s
    expect(service_catalog_and_endpoint.save).to eq(true)
  end

  it 'deletes its self' do
    expect(service_catalog_and_endpoint.destroy).to eq(true)
  end
end

require 'spec_helper'

describe OpenStackRubySDK do
  before do
    ENV['SDK'] = "openstack"
  end

  it 'has a version number' do
    expect(OpenStackRubySDK::VERSION).not_to be nil
  end

  it 'knows what services are available' do
    expect(Peace.service_catalog.available_services.size).to be > 0
  end

  it 'require ENV["SDK"] to be either :rackspace or :openstack' do
    expect( Peace.service_catalog && Peace.sdk ).to eq('openstack')
  end

  describe "OpenStack-based catalogs" do
    let!(:catalog){ Peace::ServiceCatalog.load!(:openstack) }

    it 'sets the tenant_id globally' do
      expect(Peace.tenant_id).not_to be_nil
    end

    it 'sets the auth_token globally' do
      expect(Peace.auth_token).not_to be_nil
    end

    it 'sets the catalog globally' do
      expect(Peace.service_catalog).not_to be_nil
    end

    it 'knows which services are available' do
      expect(Peace.service_catalog.available_services).not_to be_nil
    end

    it 'knows the URL for a service based on name and region' do
      expect(Peace.service_catalog.url_for('neutron')).not_to be_nil
    end

    it 'expects these env vars' do
      %w{OS_AUTH_URL OS_USERNAME OS_PASSWORD OS_TENANT_NAME}.each do |var|
        ENV[var] = nil
        expect{ Peace::ServiceCatalog.load!(:openstack) }.to raise_error RuntimeError
        ENV[var] = "something"
      end
    end
  end

end

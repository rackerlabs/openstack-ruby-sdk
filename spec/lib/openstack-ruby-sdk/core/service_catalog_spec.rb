require 'spec_helper'

describe Core::ServiceCatalog do

  it 'require ENV["SDK"] to be set' do
    expect{ Core.service_catalog }.to raise_error RuntimeError
  end

  it 'requires either an OpenStack or Rackspace-based catalog' do
    expect{ Core::ServiceCatalog.load!('nope') }.to raise_error('Requires either :rackspace or :openstack as `host`')
  end

end

class OpenStackRubySDK::Neutron::ServiceProvider  
  include Peace::Model
  attr_accessor :service_type, :default, :name
  # GET /v2.0/service-providers
end

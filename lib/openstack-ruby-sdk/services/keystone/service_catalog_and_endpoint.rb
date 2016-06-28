class OpenStackRubySDK::Keystone::ServiceCatalogAndEndpoint  
  include Peace::Model
  attr_accessor :description, :enabled, :id, :links, :name, :type
  # GET /v3/services
  # POST /v3/services
  # GET /v3/services/​{service_id}​
  # PATCH /v3/services/​{service_id}​
  # DELETE /v3/services/​{service_id}​
  # GET /v3/endpoints
  # POST /v3/endpoints
  # GET /v3/endpoints/​{endpoint_id}​
  # PATCH /v3/endpoints/​{endpoint_id}​
  # DELETE /v3/endpoints/​{endpoint_id}​
end

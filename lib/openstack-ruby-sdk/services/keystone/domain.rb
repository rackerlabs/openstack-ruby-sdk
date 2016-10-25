class OpenStackRubySDK::Keystone::Domain  
  include Core::Model
  attr_accessor :description, :enabled, :id, :links, :name
  # GET /v3/domains
  # POST /v3/domains
  # GET /v3/domains/​{domain_id}​
  # PATCH /v3/domains/​{domain_id}​
  # DELETE /v3/domains/​{domain_id}​
end

class OpenStackRubySDK::Keystone::Region  
  include Peace::Model
  attr_accessor :description, :id, :links, :parent_region_id
  # GET /v3/regions
  # POST /v3/regions
  # GET /v3/regions/​{region_id}​
  # PATCH /v3/regions/​{region_id}​
  # DELETE /v3/regions/​{region_id}​
end

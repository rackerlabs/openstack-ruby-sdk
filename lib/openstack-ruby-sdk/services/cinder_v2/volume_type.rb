class OpenStackRubySDK::CinderV2::VolumeType < Peace::Model
  attr_accessor :description, :extra_specs, :id, :is_public, :name
  # GET /v2/​{tenant_id}​/types
  # POST /v2/​{tenant_id}​/types
  # PUT /v2/​{tenant_id}​/types/​{volume_type_id}​
  # PUT /v2/​{tenant_id}​/types/​{volume_type_id}​
  # GET /v2/​{tenant_id}​/types/​{volume_type_id}​
  # DELETE /v2/​{tenant_id}​/types/​{volume_type_id}​
end

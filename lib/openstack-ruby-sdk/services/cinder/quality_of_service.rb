class OpenStackRubySDK::Cinder::QualityOfService  
  include Peace::Model
  attr_accessor :links, :qos_specs
  # POST /v2/​{tenant_id}​/qos-specs
  # GET /v2/​{tenant_id}​/qos-specs
  # GET /v2/​{tenant_id}​/qos-specs/​{qos_id}​
  # PUT /v2/​{tenant_id}​/qos-specs/​{qos_id}​
  # DELETE /v2/​{tenant_id}​/qos-specs/​{qos_id}​
  # GET /v2/​{tenant_id}​/qos-specs/​{qos_id}​/associate
  # GET /v2/​{tenant_id}​/qos-specs/​{qos_id}​/disassociate
  # GET /v2/​{tenant_id}​/qos-specs/​{qos_id}​/disassociate_all
  # GET /v2/​{tenant_id}​/qos-specs/​{qos_id}​/associations
end

class OpenStackRubySDK::CinderV2::VolumeTransfer  
  include Peace::Model
  attr_accessor :created_at, :id, :links, :name, :volume_id
  # POST /v2/​{tenant_id}​/os-volume-transfer
  # GET /v2/​{tenant_id}​/os-volume-transfer
  # GET /v2/​{tenant_id}​/os-volume-transfer/detail
  # GET /v2/​{tenant_id}​/os-volume-transfer/​{transfer_id}​
  # DELETE /v2/​{tenant_id}​/os-volume-transfer/​{transfer_id}​
  # POST /v2/​{tenant_id}​/os-volume-transfer/​{transfer_id}​/accept
end

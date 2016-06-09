class OpenStackRubySDK::CinderV2::VolumeSnapshot < Peace::Model
  attr_accessor :created_at, :description, :id, :metadata, :name, :os_extended_snapshot_attributes, :size, :status, :volume_id
  # POST /v2/​{tenant_id}​/snapshots
  # GET /v2/​{tenant_id}​/snapshots
  # GET /v2/​{tenant_id}​/snapshots/detail
  # GET /v2/​{tenant_id}​/snapshots/​{snapshot_id}​
  # PUT /v2/​{tenant_id}​/snapshots/​{snapshot_id}​
  # DELETE /v2/​{tenant_id}​/snapshots/​{snapshot_id}​
  # GET /v2/​{tenant_id}​/snapshots/​{snapshot_id}​/metadata
  # PUT /v2/​{tenant_id}​/snapshots/​{snapshot_id}​/metadata
end

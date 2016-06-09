class OpenStackRubySDK::CinderV2::Volume < Peace::Model
  attr_accessor :attachments, :availability_zone, :bootable, :consistencygroup_id, :created_at, :description, :encrypted, :id, :links, :metadata, :migration_status, :multiattach, :name, :"os-vol-host-attr:host", :"os-vol-mig-status-attr:migstat", :"os-vol-mig-status-attr:name_id", :"os-vol-tenant-attr:tenant_id", :"os-volume-replication:driver_data", :"os-volume-replication:extended_status", :replication_status, :size, :snapshot_id, :source_volid, :status, :user_id, :volume_type
  # POST /v2/​{tenant_id}​/volumes
  # GET /v2/​{tenant_id}​/volumes
  # GET /v2/​{tenant_id}​/volumes/detail
  # GET /v2/​{tenant_id}​/volumes/​{volume_id}​
  # PUT /v2/​{tenant_id}​/volumes/​{volume_id}​
  # DELETE /v2/​{tenant_id}​/volumes/​{volume_id}​
  # POST /v2/​{tenant_id}​/volumes/​{volume_id}​/metadata
  # GET /v2/​{tenant_id}​/volumes/​{volume_id}​/metadata
  # PUT /v2/​{tenant_id}​/volumes/​{volume_id}​/metadata
end

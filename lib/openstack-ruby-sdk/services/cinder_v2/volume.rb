class OpenStackRubySDK::CinderV2::Volume  
  include Peace::Model
  attr_accessor :attachments, :availability_zone, :bootable, :consistencygroup_id, :created_at, :description, :encrypted, :id, :links, :metadata, :migration_status, :multiattach, :name, :os_vol_host_attr, :os_vol_mig_status_attr, :os_vol_mig_status_attr, :os_vol_tenant_attr, :os_volume_replication, :os_volume_replication, :replication_status, :size, :snapshot_id, :source_volid, :status, :user_id, :volume_type
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

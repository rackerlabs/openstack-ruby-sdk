class OpenStackRubySDK::CinderV2::Backup  
  include Peace::Model
  attr_accessor :availability_zone, :container, :created_at, :description, :fail_reason, :has_dependent_backups, :id, :is_incremental, :links, :name, :object_count, :size, :status, :volume_id
  # POST /v2/​{tenant_id}​/backups
  # GET /v2/​{tenant_id}​/backups
  # GET /v2/​{tenant_id}​/backups/detail
  # GET /v2/​{tenant_id}​/backups/​{backup_id}​
  # DELETE /v2/​{tenant_id}​/backups/​{backup_id}​
  # POST /v2/​{tenant_id}​/backups/​{backup_id}​/restore
end

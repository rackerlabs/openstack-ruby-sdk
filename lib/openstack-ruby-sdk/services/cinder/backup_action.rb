class OpenStackRubySDK::Cinder::BackupAction  
  include Peace::Model
  attr_accessor :os_force_delete
  # POST /v2/​{tenant_id}​/backups/​{backup_id}​/action
end

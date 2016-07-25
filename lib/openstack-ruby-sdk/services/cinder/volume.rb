class OpenStackRubySDK::Cinder::Volume
  include Peace::Model
  include Peace::Metadata

  attr_accessor :attachments, :availability_zone, :bootable, :consistencygroup_id, :created_at, :description, :encrypted, :id, :links, :metadata, :migration_status, :multiattach, :name, :os_vol_host_attr, :os_vol_mig_status_attr, :os_vol_mig_status_attr, :os_vol_tenant_attr, :os_volume_replication, :os_volume_replication, :replication_status, :size, :snapshot_id, :source_volid, :status, :user_id, :volume_type, :display_name, :display_description

  def detail
    self.reload
  end
end

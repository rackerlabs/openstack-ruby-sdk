class OpenStackRubySDK::CinderV2::VolumeManageExtension < Peace::Model
  attr_accessor :attachments, :availability_zone, :bootable, :created_at, :description, :encrypted, :id, :links, :metadata, :name, :"os-vol-tenant-attr:tenant_id", :size, :snapshot_id, :source_volid, :status, :user_id, :volume_type
  # POST /v2/​{tenant_id}​/os-volume-manage
end

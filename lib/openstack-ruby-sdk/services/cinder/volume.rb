class OpenStackRubySDK::Cinder::Volume
  include Peace::Model
  include Peace::Metadata

  attr_accessor :attachments, :availability_zone, :bootable, :consistencygroup_id, :created_at, :description, :encrypted, :id, :links, :metadata, :migration_status, :multiattach, :name, :replication_status, :size, :snapshot_id, :source_volid, :status, :user_id, :volume_type, :display_name, :display_description

  attr_with_alias :state, :status
  attr_with_alias :tenant_id, "os-vol-tenant-attr:tenant_id"
  attr_with_alias :tenant_host, "os-vol-tenant-attr:host"
  attr_with_alias :tenant_name_id, "os-vol-tenant-attr:name_id"
  attr_with_alias :tenant_migstat, "os-vol-tenant-attr:migstat"
  attr_with_alias :host, "os-vol-host-attr:host"
  attr_with_alias :migration_name_id, "os-vol-mig-status-attr:name_id"
  attr_with_alias :migration_status, "os-vol-mig-status-attr:migstat"

  def detail
    self.reload
  end

  def extend_size(new_size)
    perform_action!("os-extend": { new_size: new_size })
  end

  def reset_status(options={})
    status  = options[:status] || "available"
    attach  = options[:attach] || "detached"
    migrate = options[:migrate] || "migrating"

    data = Peace::Helpers.payload_builder("os-reset_status", {
      status: status,
      attach_status: attach,
      migration_status: migrate
    })

    perform_action!(data)
  end

  def unmanage
  end

  def attach_to(server)
    server.attach_volume(self.id)
  end

  def force_detach
  end

  def promote
  end

  def reenable_replication
  end

  private

  def perform_action!(data)
    Peace::Request.post("#{url}/action", data)
  end
end

class OpenStackRubySDK::Cinder::Volume
  include Core::Model
  include Core::Metadata

  attr_accessor :attachments, :availability_zone, :bootable, :consistencygroup_id, :created_at, :description, :encrypted, :id, :links, :metadata, :migration_status, :multiattach, :name, :replication_status, :size, :snapshot_id, :source_volid, :status, :user_id, :volume_type, :display_name, :display_description

  attr_with_alias :host, "os-vol-host-attr:host"
  attr_with_alias :migration_name_id, "os-vol-mig-status-attr:name_id"
  attr_with_alias :migration_status, "os-vol-mig-status-attr:migstat"
  attr_with_alias :replication_driver, "os-volume-replication:driver_data"
  attr_with_alias :replication_status, "os-volume-replication:extended_status"
  attr_with_alias :state, :status
  attr_with_alias :tenant_host, "os-vol-tenant-attr:host"
  attr_with_alias :tenant_id, "os-vol-tenant-attr:tenant_id"
  attr_with_alias :tenant_migstat, "os-vol-tenant-attr:migstat"
  attr_with_alias :tenant_name_id, "os-vol-tenant-attr:name_id"

  def take_snapshot!(name, description)
    OpenStackRubySDK::Cinder::Snapshot.create({
      name: name,
      force: true,
      volume_id: self.id,
      description: description
    })
  end

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

    data = Core::Helpers.payload_builder("os-reset_status", {
      status: status,
      attach_status: attach,
      migration_status: migrate
    })

    perform_action!(data)
  end

  def unmanage!
    perform_action!({ "os-unmanage": {} })
  end

  def attach_to(server)
    server.attach_volume(self.id)
  end

  def force_detach!
    att_id = self.attachments.first['attachment_id']
    data   = { "os-force_detach": { "attachment_id": "#{att_id}" } }
    perform_action!(data)
  end

  private

  def perform_action!(data)
    Core::Request.post("#{url}/action", data)
  end
end

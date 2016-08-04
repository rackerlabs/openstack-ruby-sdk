class OpenStackRubySDK::Cinder::Backup
  include Peace::Model
  
  attr_accessor :availability_zone, :container, :created_at, :description, :fail_reason, :has_dependent_backups, :id, :is_incremental, :links, :name, :object_count, :size, :status, :volume_id, :updated_at, :data_timestamp, :snapshot_id

  attr_with_alias :state, :status

  def create(opts={})
    data = Peace::Helpers.payload_builder("backup", {
      container: nil,
      description: opts.fetch(:description, ''),
      name: opts.fetch(:name),
      volume_id: opts.fetch(:volume_id),
      incremental: true
    })

    self.new(Peace::Request.post(url, data))
  end

  def detail
    self.reload
  end

  def restore!(volume)
    url  = "#{self.url}/restore"
    data = { restore: { backup_id: self.id, volume_id: volume.id } }
    Peace::Request.post(url, data)
  end

  def force_delete!
    url  = "#{self.url}/action"
    data = { "os-force_delete": {} }
    Peace::Request.post(url, data)
  end
end

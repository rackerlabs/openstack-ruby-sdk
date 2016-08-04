class OpenStackRubySDK::Cinder::Backup
  include Peace::Model
  attr_accessor :availability_zone, :container, :created_at, :description, :fail_reason, :has_dependent_backups, :id, :is_incremental, :links, :name, :object_count, :size, :status, :volume_id, :updated_at, :data_timestamp, :snapshot_id

  attr_with_alias :state, :status

  # POST /v2/​{tenant_id}​/backups
  # GET /v2/​{tenant_id}​/backups
  # GET /v2/​{tenant_id}​/backups/detail
  # GET /v2/​{tenant_id}​/backups/​{backup_id}​
  # DELETE /v2/​{tenant_id}​/backups/​{backup_id}​
  # POST /v2/​{tenant_id}​/backups/​{backup_id}​/restore

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
    data = { restore: { backup_id: self.id, volume_id: volume.id } }
    url = "#{self.url}/restore"
    Peace::Request.post(url, data)
  end
end

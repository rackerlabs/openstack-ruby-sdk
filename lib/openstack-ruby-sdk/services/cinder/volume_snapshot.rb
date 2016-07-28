class OpenStackRubySDK::Cinder::VolumeSnapshot
  include Peace::Model
  include Peace::Metadata

  attr_accessor :created_at, :description, :id, :name, :size, :status, :volume_id, :metadata

  attr_with_alias :status, :state
  attr_with_alias :name, :display_name
  attr_with_alias :description, :display_description
  attr_with_alias :progress, "os-extended-snapshot-attributes:progress"
  attr_with_alias :project_id, "os-extended-snapshot-attributes:project_id"

  rackspace_api_path "snapshots"
  json_key_name :snapshot

  def self.create(opts={})
    data = Peace::Helpers.payload_builder("snapshot", {
      display_name: opts.fetch(:name),
      display_description: opts.fetch(:description),
      volume_id: opts.fetch(:volume_id),
      force: opts.fetch(:force)
    })

    response = Peace::Request.post(collection_url, data)
    snapshot = self.new(response)
    Peace::Helpers.wait_for(snapshot, 'available')
  end

end

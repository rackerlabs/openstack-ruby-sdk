class OpenStackRubySDK::Nova::Image
  include Core::Model
  include Core::Metadata

  attr_accessor :id, :name, :created, :updated, :user_id, :tenant_id, :progress, :minDisk, :minRam, :disk_config, :links, :server, :metadata

  attr_with_alias :disk_config, 'OS-DCF:diskConfig'
  attr_with_alias :size, 'OS-EXT-IMG-SIZE:size'
  attr_with_alias :state, 'status'

  belongs_to :user
  belongs_to :tenant

	def details
    self.reload
  end
end

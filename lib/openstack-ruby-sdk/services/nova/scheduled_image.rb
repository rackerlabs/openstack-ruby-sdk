class OpenStackRubySDK::Nova::ScheduledImage
  include Core::Model

  attr_accessor :id, :name, :created, :updated, :user_id, :tenant_id, :progress, :minDisk, :minRam, :disk_config, :links, :server, :metadata

  attr_with_alias :disk_config, 'OS-DCF:diskConfig'
  attr_with_alias :size, 'OS-EXT-IMG-SIZE:size'
  attr_with_alias :state, 'status'

  belongs_to :user
  belongs_to :tenant

  # TODO: This is RAX-only
	def enable_scheduled_images; end
	def disable_scheduled_images; end
	def scheduled_images; end
end

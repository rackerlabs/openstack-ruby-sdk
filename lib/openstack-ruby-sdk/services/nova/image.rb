class OpenStackRubySDK::Nova::Image
  include Peace::Model

  attr_accessor :id, :name, :created, :updated, :user_id, :tenant_id, :progress, :minDisk, :minRam, :disk_config, :links, :server, :metadata

  attr_with_alias :disk_config, 'OS-DCF:diskConfig'
  attr_with_alias :size, 'OS-EXT-IMG-SIZE:size'
  attr_with_alias :state, 'status'

  belongs_to :user
  belongs_to :tenant

	def details
    self.reload
  end

	def metadata; end
	def set_metadata; end

	def get_metadata_item; end
	def set_metadata_item; end
	def delete_metadata_item; end
end

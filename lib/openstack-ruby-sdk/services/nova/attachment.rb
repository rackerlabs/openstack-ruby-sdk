class OpenStackRubySDK::Nova::Attachment < Peace::Model
  attr_accessor :id, :server_id, :volume_id, :device
  attr_with_alias :server_id, :serverId
  attr_with_alias :volume_id, :volumeId

  belongs_to :server
  belongs_to :volume

  def attach_volume; end
end

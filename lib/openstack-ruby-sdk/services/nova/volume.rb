class OpenStackRubySDK::Nova::Volume < Peace::Model

  attr_accessor :id, :device, :server_id, :volume_id

  attr_with_alias :server_id, :serverId
  attr_with_alias :volume_id, :volumeId

  belongs_to :server
  belongs_to :volume
  has_many :attachments
  has_many :volumes

  json_key_name :volumeAttachments
  rackspace_api_path "/servers/{{server_id}}/os-volume_attachments"

end

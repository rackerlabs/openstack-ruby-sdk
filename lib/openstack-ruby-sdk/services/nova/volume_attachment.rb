class OpenStackRubySDK::Nova::VolumeAttachment
  include Peace::Model

  attr_accessor :id, :server_id, :volume_id, :device

  attr_with_alias :server_id, :serverId
  attr_with_alias :volume_id, :volumeId

  belongs_to :server
  belongs_to :volume

  rackspace_api_path "/servers/{{server_id}}/os-volume_attachments"

  class << self
    def attach; end
    def volumes_for_server(server); end
  end

  def detach; end
  def details; end
  def server; end
  def volume; end

end

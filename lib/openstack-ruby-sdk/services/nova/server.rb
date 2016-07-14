class OpenStackRubySDK::Nova::Server
  include Peace::Model

  REBOOT_TYPES = ['SOFT', 'HARD']

  attr_accessor :id, :name, :created, :updated, :progress, :user_id, :tenant_id, :links, :personality, :config_drive, :user_data, :addresses, :boot_volume_id, :boot_volume_size, :boot_image_id, :key_name, :metadata, :image, :flavor, :security_groups

  attr_with_alias :availability_zone, 'OS-EXT-AZ:availability_zone'
  attr_with_alias :bandwidth, 'rax-bandwidth:bandwidth'
  attr_with_alias :disk_config, 'OS-DCF:diskConfig'
  attr_with_alias :flavor_id, :flavorRef
  attr_with_alias :host_id, :hostId
  attr_with_alias :host, 'OS-EXT-SRV-ATTR:host'
  attr_with_alias :hypervisor_hostname, 'OS-EXT-SRV-ATTR:hypervisor_hostname'
  attr_with_alias :image_id, :imageRef
  attr_with_alias :instance_name, 'OS-EXT-SRV-ATTR:instance_name'
  attr_with_alias :ipv4_address, 'accessIPv4'
  attr_with_alias :ipv6_address, 'accessIPv6'
  attr_with_alias :launched_at, 'OS-SRV-USG:launched_at'
  attr_with_alias :password, :adminPass
  attr_with_alias :power_state, 'OS-EXT-STS:power_state'
  attr_with_alias :state_ext, 'OS-EXT-STS:task_state'
  attr_with_alias :state, :status
  attr_with_alias :terminated_at, 'OS-SRV-USG:terminated_at'
  attr_with_alias :vm_state, 'OS-EXT-STS:vm_state'
  attr_with_alias :volumes_attached, 'os-extended-volumes:volumes_attached'
  attr_with_alias :zone_id, 'RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId'

  class << self
  	def create_from_volume
      # https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#create-bootable-volume-and-server
    end
  	def create_with_disk_config; end
  end

	def attach_volume; end
	def detach_volume; end

	def details
    self.reload
  end

	def key_pairs
    OpenStackRubySDK::Nova::KeyPair.all
  end

	def available_actions
    OpenStackRubySDK::Nova::Action.all(server_id: id)
  end

	def metadata; end

  def volumes
    OpenStackRubySDK::Nova::Volume.all(server_id: id)
  end

  def save
    data = Peace::Helpers.payload_builder(:server, {
      'OS-DCF:diskConfig': disk_config,
      accessIPv4: ipv4_address,
      accessIPv6: ipv6_address,
      name: name
    })

    refresh! Peace::Request.put(url, data)
  end

  # http://api.rackspace.com/#changePassword
  def change_password(pass)
    # TODO: This doesn't seem to work; always get the same error.
    perform_action!(changePassword: { adminPass: pass })
  end

  # http://api.rackspace.com/#createImage
  def create_image(name, options={})
    perform_action!({ createImage: { name: name, metadata: options } })
  end

  # http://api.rackspace.com/#confirmResizeServer
  def confirm_resize
    perform_action!(confirmResize: nil)
  end

  # http://api.rackspace.com/#rebootServer
  def reboot(type='SOFT')
    perform_action!(reboot: { type: type })
  end

  # http://api.rackspace.com/#rebuildServer
  def rebuild
    data = Peace::Helpers.payload_builder(:rebuild, {
      'OS-DCF:diskConfig': disk_config,
      accessIPv4: ipv4_address,
      accessIPv6: ipv6_address,
      adminPass: password,
      imageRef: image['id'],
      metadata: metadata,
      name: name
    })

    perform_action!(data)
  end

  # http://api.rackspace.com/#rescueServer
  def rescue(imageRef="none")
    # TODO: This 'none' aspect doesn't seem to work with OpenStack?
    if imageRef == "none"
      data = { rescue: "none" }
    else
      data = { rescue: { rescue_image_ref: imageRef } }
    end

    perform_action!(data)
  end

  # http://api.rackspace.com/#resizeServer
  def resize(flavorRef)
    data = {
      "resize": {
          "flavorRef": "#{flavorRef}",
          "OS-DCF:diskConfig": "AUTO"
      }
    }
    perform_action!(data)
  end

  # http://api.rackspace.com/#revertResizeServer
  def revert_resize
    perform_action!(revertResize: nil)
  end

  # http://api.rackspace.com/#unrescueServer
  def unrescue
    perform_action!(unrescue: nil)
  end

  private

  def perform_action!(data)
    Peace::Request.post("#{url}/action", data)
  end

end

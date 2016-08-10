class OpenStackRubySDK::Nova::Server
  include Peace::Model
  include Peace::Metadata

  REBOOT_TYPES = ['SOFT', 'HARD']

  attr_accessor :id, :name, :created, :updated, :progress, :user_id, :tenant_id, :links, :personality, :config_drive, :user_data, :addresses, :boot_volume_id, :boot_volume_size, :boot_image_id, :key_name, :image, :flavor, :security_groups, :metadata

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

    # TODO: This is asking for device UUIDs. Isn't that what we're creating?
  	def create_from_volume(options={})
      volume_data = Peace::Helpers.payload_builder(:block_device_mapping_v2, {
        uuid: options[:uuid],
        volume_size: options[:volume_size],
        source_type: 'image',
        delete_on_termination: true
      })

      data = Peace::Helpers.payload_builder(:server, {
        name: options[:name],
        imageRef: options[:imageRef],
        flavorRef: options[:flavorRef]
      })

      data[:server].merge!(volume_data)

      # Expects an array of block device hash(es)
      volume_info = data[:server][:block_device_mapping_v2]
      data[:server][:block_device_mapping_v2] = [volume_info]

      response = Peace::Request.post(collection_url, data)
    end
  end

	def attach_volume(volume_id)
    data       = Peace::Helpers.payload_builder(:volumeAttachment, { volumeId: volume_id })
    url        = "#{self.url}/os-volume_attachments"
    response   = Peace::Request.post(url, data)
    attachment = OpenStackRubySDK::Nova::VolumeAttachment.new(response)
    self.reload
    attachment
  end

	 def detach_volume(volume_id)
    attachments = OpenStackRubySDK::Nova::VolumeAttachment.all(server_id: id)
    attachment  = attachments.find{ |a| a.volume_id == volume_id}

    if attachment.present?
      url = "#{self.url}/os-volume_attachments/#{attachment.id}"
      Peace::Request.delete(url)
    else
      raise "No attachment with #{volume_id} found."
    end
  end

  def volume_attachments
    OpenStackRubySDK::Nova::VolumeAttachment.all(server_id: id)
  end

	def details
    self.reload
  end

	def key_pairs
    OpenStackRubySDK::Nova::KeyPair.all
  end

	def available_actions
    OpenStackRubySDK::Nova::Action.all(server_id: id)
  end

  def volumes
    OpenStackRubySDK::Nova::VolumeAttachment.all(server_id: id).map do |va|
      OpenStackRubySDK::Cinder::Volume.find(va.volume_id)
    end
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

  def virtual_interfaces
    url = "#{self.url}/os-virtual-interfaces"
    Peace::Request.get(url)
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
      metadata: '',
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

  def console
    perform_action!({ "os-getVNCConsole": { "type": "xvpvnc" } })
  end

  private

  def perform_action!(data)
    Peace::Request.post("#{url}/action", data)
  end

end

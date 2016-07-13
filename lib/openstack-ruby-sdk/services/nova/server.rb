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
  	def create_with_disk_config; end
  	def servers_with_details; end
  end

	def attach_volume; end
	def confirm_resize; end
	def create_bootable_volume; end
	def delete_volume_attachment; end
	def details; end
	def key_pairs; end
	def log_details_action; end
	def metadata; end
	def network_addresses_and_network; end
	def retrieves_addresses; end
	def volume_attachment_details; end
  def attachments; end
  def boot_image; end
  def boot_volume; end
  def tenant; end
  def user; end
  def volumes; end

  def save
    data = { server: {} }
    data[:server].merge!({ accessIPv4: ipv4_address }) if ipv4_address.present?
    data[:server].merge!({ accessIPv6: ipv6_address }) if ipv6_address.present?
    data[:server].merge!({ name: name }) if name.present?
    refresh! Peace::Request.put(url, data)
  end

  # http://api.rackspace.com/#changePassword
  def change_password(pass)
    perform_action!(changePassword: {adminPass: pass})
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
    # data = {
    #     "rebuild" :{
    #         "name" : "new-server-test",
    #         "imageRef" : "d42f821e-c2d1-4796-9f07-af5ed7912d0e",
    #         "OS-DCF:diskConfig" : "AUTO",
    #         "adminPass" : "diane123",
    #         "metadata" : {
    #             "My Server Name" : "Apache1"
    #         },
    #         "personality" : [
    #             {
    #                 "path" : "/etc/banner.txt",
    #                 "contents" : "ICAgICAgDQoiQSBjbG91ZCBkb2VzIG5vdCBrbm93IHdoeSBp dCBtb3ZlcyBpbiBqdXN0IHN1Y2ggYSBkaXJlY3Rpb24gYW5k IGF0IHN1Y2ggYSBzcGVlZC4uLkl0IGZlZWxzIGFuIGltcHVs c2lvbi4uLnRoaXMgaXMgdGhlIHBsYWNlIHRvIGdvIG5vdy4g QnV0IHRoZSBza3kga25vd3MgdGhlIHJlYXNvbnMgYW5kIHRo ZSBwYXR0ZXJucyBiZWhpbmQgYWxsIGNsb3VkcywgYW5kIHlv dSB3aWxsIGtub3csIHRvbywgd2hlbiB5b3UgbGlmdCB5b3Vy c2VsZiBoaWdoIGVub3VnaCB0byBzZWUgYmV5b25kIGhvcml6 b25zLiINCg0KLVJpY2hhcmQgQmFjaA=="
    #             }
    #         ]
    #     }
    # }
    #
    # perform_action!(data)
  end

  # http://api.rackspace.com/#rescueServer
  def rescue(imageRef="none")
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

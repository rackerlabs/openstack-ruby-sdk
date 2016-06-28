class OpenStackRubySDK::Nova::Server  
  include Peace::Model

  REBOOT_TYPES = ['SOFT', 'HARD']

  attr_accessor :id, :name, :created, :updated, :progress, :user_id, :tenant_id, :links, :personality, :config_drive, :user_data, :addresses, :boot_volume_id, :boot_volume_size, :boot_image_id, :key_name, :metadata, :flavorRef, :imageRef

  attr_with_alias :bandwidth, 'rax-bandwidth:bandwidth'
  attr_with_alias :disk_config, 'OS-DCF:diskConfig'
  attr_with_alias :host_id, :hostId
  attr_with_alias :ipv4_address, 'accessIPv4'
  attr_with_alias :ipv6_address, 'accessIPv6'
  attr_with_alias :password, :adminPass
  attr_with_alias :power_state, 'OS-EXT-STS:power_state'
  attr_with_alias :state_ext, 'OS-EXT-STS:task_state'
  attr_with_alias :state, :status
  attr_with_alias :vm_state, 'OS-EXT-STS:vm_state'
  attr_with_alias :zone_id, 'RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId'

  belongs_to :user
  belongs_to :tenant
  belongs_to :boot_volume
  belongs_to :boot_image
  has_many :attachments
  has_many :volumes

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

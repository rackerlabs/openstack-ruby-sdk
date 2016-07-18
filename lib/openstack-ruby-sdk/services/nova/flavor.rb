class OpenStackRubySDK::Nova::Flavor
  include Peace::Model

  attr_accessor :id, :name, :links, :ram, :vcpus, :swap, :rxtx_factor, :disk

  attr_with_alias :extra_specs, 'OS-FLV-WITH-EXT-SPECS:extra_specs'
  attr_with_alias :ephemeral, 'OS-FLV-EXT-DATA:ephemeral'
  attr_with_alias :disabled, 'OS-FLV-DISABLED:disabled'
  attr_with_alias :is_public, 'os-flavor-access:is_public'

  class << self
  	def flavors_with_details; end
  	def flavors_with_extra_specs; end
  end

	def details
    self.reload
  end

	def extra_specs; end
end

class OpenStackRubySDK::Nova::Flavor < Peace::Model
  attr_accessor :id, :name, :links, :ram, :vcpus, :swap, :rxtx_factor, :disk
  attr_with_alias :extra_specs, 'OS-FLV-WITH-EXT-SPECS:extra_specs'
  attr_with_alias :ephemeral, 'OS-FLV-EXT-DATA:ephemeral'

  validates :name, :links, presence: true

  class << self
  	def flavors_with_details; end
  	def flavors_with_extra_specs; end
  end

	def details; end
	def extra_specs; end
end

class OpenStackRubySDK::Savanna::Flavor 
  include Core::Model
	attr_accessor :class, :disk, :id, :name, :ram, :vcpus

	has_many :nodes

	class << self
		def available_flavors; end
	end

	def resource_limits; end
end

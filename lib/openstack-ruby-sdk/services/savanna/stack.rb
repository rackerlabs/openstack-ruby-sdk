class OpenStackRubySDK::Savanna::Stack 
  include Peace::Model
	attr_accessor :created, :description, :distro, :id, :links, :name, :node_groups, :services

	has_many :clusters

	class << self
		def all_stacks; end
	end

	def details; end
end

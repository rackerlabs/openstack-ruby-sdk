class OpenStackRubySDK::Savanna::Node 
  include Core::Model
	attr_accessor :addresses, :components, :created, :flavor_id, :id, :links, :name, :node_group, :status, :updated

	belongs_to :flavor

	def cluster_nodes; end
end

class OpenStackRubySDK::Trove::HighAvailability 
  include Core::Model
	attr_accessor :acls, :configuration, :datastore, :flavor, :id, :name, :networks, :replica_source, :replicas, :state, :tenant_id, :volume
	
	def acls; end
	def add_acls; end
	def add_replica; end
	def attach_configuration_group; end
	def delete_acls; end
	def details; end
	def remove_configuration_group; end
	def remove_replica; end
	def resize_flavor; end
	def resize_volume; end
	def restart; end
end

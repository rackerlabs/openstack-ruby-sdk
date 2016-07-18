class OpenStackRubySDK::Raksha::Agent 
  include Peace::Model
	attr_accessor :agent_version, :architecture, :backup_container, :backup_datacenter, :backup_vault_size, :cleanup_allowed, :datacenter, :flavor, :host_server_id, :ip_address, :is_disabled, :is_encrypted, :machine_agent_id, :machine_name, :operating_system, :operating_system_version, :public_key, :status, :time_of_last_successful_backup, :use_failover_uri, :use_service_net

	class << self
		def agent_details_by_host_server_id; end
	end

	def details; end
	def enable_or_disable; end
	def enable_volume_encryption; end
	def change_encryption_password; end
	def migrate_vault; end
	def change_backup_behavior; end
end

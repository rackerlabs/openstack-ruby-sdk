class OpenStackRubySDK::Raksha::User 
  include Core::Model
	attr_accessor :agent_version, :architecture, :backup_container, :backup_vault_size, :cleanup_allowed, :datacenter, :flavor, :ip_address, :is_disabled, :is_encrypted, :machine_agent_id, :machine_name, :operating_system, :operating_system_version, :public_key, :status, :time_of_last_successful_backup, :use_service_net

	belongs_to :machine_agent

	def all_agents_for_user; end
	def wake_up_agents; end
end

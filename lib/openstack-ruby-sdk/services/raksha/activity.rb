class OpenStackRubySDK::Raksha::Activity 
  include Peace::Model
	attr_accessor :id, :type, :parent_id, :display_name, :is_backup_configuration_deleted, :source_machine_agent_id, :source_machine_name, :destination_machine_agent_id, :destination_machine_name, :current_state, :time_of_activity, :backup_id

	class << self
		def activity_for_agent; end
		def activity_for_user; end
	end
end

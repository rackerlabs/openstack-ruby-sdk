class OpenStackRubySDK::Raksha::BackupConfiguration 
  include Peace::Model
	attr_accessor :backup_configuration_id, :machine_agent_id, :machine_name, :flavor, :is_encrypted, :backup_configuration_name, :is_active, :is_deleted, :version_retention, :backup_configuration_schedule_id, :missed_backup_action_id, :frequency, :start_time_hour, :start_time_minute, :start_time_am_pm, :day_of_week_id, :hour_interval, :time_zone_id, :next_scheduled_run_time, :last_run_time, :last_run_backup_report_id, :notify_recipients, :notify_success, :notify_failure, :inclusions, :exclusions

	belongs_to :backup_configuration
	belongs_to :machine_agent
	belongs_to :backup_configuration_schedule
	belongs_to :missed_backup_action
	belongs_to :day_of_week
	belongs_to :time_zone
	belongs_to :last_run_backup_report
	has_many :backup_configurations
	has_many :restores
	has_many :restore_configurations

	class << self
		def all_backup_configurations_for_user; end
		def all_backup_configurations_for_agent; end
	end

	def details; end
	def enable_or_disable_a_backup_configuration; end
end

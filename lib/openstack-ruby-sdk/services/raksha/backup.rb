class OpenStackRubySDK::Raksha::Backup
  include Peace::Model
	attr_accessor :BackupId, :BackupConfigurationId, :CurrentState, :BackupConfigurationName, :MachineAgentId, :MachineName, :StateChangeTime, :IsEncrypted, :EncryptionKey
	has_many :restores
	has_many :restore_configurations

	class << self
		def completed_backups; end
		def backup_report; end
	end

	def start_or_stop_a_backup_manually; end
	def details; end
end

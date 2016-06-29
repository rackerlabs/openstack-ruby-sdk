class OpenStackRubySDK::Trove::ConfigurationParameter 
  include Peace::Model
	attr_accessor :max, :min, :name, :restart_required, :type
	
	def details; end
	def without_datastore; end
	def details_without_datastore; end
	def verbose_default_configuration_parameters; end
end

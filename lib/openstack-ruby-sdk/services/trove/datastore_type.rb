class OpenStackRubySDK::Trove::DatastoreType 
  include Core::Model
	attr_accessor :default_version, :id, :links, :name, :versions
	
	def versions; end
end

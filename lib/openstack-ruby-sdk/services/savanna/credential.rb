class OpenStackRubySDK::Savanna::Credential 
  include Core::Model
	attr_accessor :ssh_keys, :cloud_files
	
	class << self
		def credentials_by_type; end
	end

end

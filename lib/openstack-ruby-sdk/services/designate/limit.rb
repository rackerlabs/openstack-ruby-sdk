class OpenStackRubySDK::Designate::Limit 
  include Core::Model
	attr_accessor :absolute, :rates
	
	class << self
		def limit_types; end
	end
end

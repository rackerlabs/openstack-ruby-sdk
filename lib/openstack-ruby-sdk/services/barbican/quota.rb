class OpenStackRubySDK::Barbican::Quotum
  include Core::Model
	attr_accessor :cas, :consumers, :containers, :orders, :secrets

	class << self
		def project_quotas; end
	end
end

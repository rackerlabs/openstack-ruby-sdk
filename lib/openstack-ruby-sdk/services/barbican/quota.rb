class OpenStackRubySDK::Barbican::Quotum
  include Peace::Model
	attr_accessor :cas, :consumers, :containers, :orders, :secrets

	class << self
		def project_quotas; end
	end
end

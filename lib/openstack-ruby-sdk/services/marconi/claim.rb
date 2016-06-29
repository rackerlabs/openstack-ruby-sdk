class OpenStackRubySDK::Marconi::Claim 
  include Peace::Model
  attr_accessor :id, :grace, :ttl, :limit, :messages
  has_many :messages

	def release; end
end

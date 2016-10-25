class OpenStackRubySDK::Marconi::Claim 
  include Core::Model
  attr_accessor :id, :grace, :ttl, :limit, :messages
  has_many :messages

	def release; end
end

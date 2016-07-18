class OpenStackRubySDK::Poppy::Flavor 
  include Peace::Model
  attr_accessor :id, :providers, :links
  has_many :services
  has_many :ssl_certificates

	def details; end
end

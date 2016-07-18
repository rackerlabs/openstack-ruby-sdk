class OpenStackRubySDK::Barbican::Secret
  include Peace::Model
	attr_accessor :algorithm, :bit_length, :content_types, :created, :expiration, :mode, :name, :secret_ref, :status, :updated

	def metadata; end
end

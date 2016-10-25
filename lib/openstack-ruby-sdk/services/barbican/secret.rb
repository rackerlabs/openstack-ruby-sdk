class OpenStackRubySDK::Barbican::Secret
  include Core::Model
	attr_accessor :algorithm, :bit_length, :content_types, :created, :expiration, :mode, :name, :secret_ref, :status, :updated

	def metadata; end
end

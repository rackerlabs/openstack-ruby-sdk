class OpenStackRubySDK::Barbican::Container
  include Peace::Model
  attr_accessor :consumers, :container_ref, :created, :name, :secret_refs, :status, :type, :updated
end

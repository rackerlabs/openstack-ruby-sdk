class OpenStackRubySDK::Ceilometer::Capability
  include Core::Model
  attr_accessor :api, :event_storage, :storage
  # "GET /v2/capabilities",
end

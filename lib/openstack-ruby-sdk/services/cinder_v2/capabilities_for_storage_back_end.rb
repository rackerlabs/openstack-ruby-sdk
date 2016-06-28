class OpenStackRubySDK::CinderV2::CapabilitiesForStorageBackEnd  
  include Peace::Model
  attr_accessor :description, :display_name, :driver_version, :namespace, :pool_name, :properties, :storage_protocol, :vendor_name, :visibility, :volume_backend_name
  # GET /v2/​{tenant_id}​/capabilities/​{hostname}​
end

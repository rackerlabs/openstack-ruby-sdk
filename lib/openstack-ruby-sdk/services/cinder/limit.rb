class OpenStackRubySDK::Cinder::Limit  
  include Peace::Model
  attr_accessor :absolute, :rate
  # GET /v2/​{tenant_id}​/limits
end

class OpenStackRubySDK::Cinder::QuotaSetsExtension  
  include Peace::Model
  attr_accessor :quota_set
  # GET /v2/​{admin_tenant_id}​/os-quota-sets/​{tenant_id}​
  # PUT /v2/​{admin_tenant_id}​/os-quota-sets/​{tenant_id}​
  # DELETE /v2/​{admin_tenant_id}​/os-quota-sets/​{tenant_id}​
  # GET /v2/​{tenant_id}​/os-quota-sets/defaults
  # GET /v2/​{admin_tenant_id}​/os-quota-sets/​{tenant_id}​/​{user_id}​
  # PUT /v2/​{admin_tenant_id}​/os-quota-sets/​{tenant_id}​/​{user_id}​
  # DELETE /v2/​{admin_tenant_id}​/os-quota-sets/​{tenant_id}​/​{user_id}​
  # GET /v2/​{admin_tenant_id}​/os-quota-sets/​{tenant_id}​/detail/​{user_id}​
end

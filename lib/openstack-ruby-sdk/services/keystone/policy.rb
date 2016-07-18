class OpenStackRubySDK::Keystone::Policy  
  include Peace::Model
  attr_accessor :blob, :id, :links, :project_id, :type, :user_id
  # POST /v3/policies
  # GET /v3/policies
  # GET /v3/policies/​{policy_id}​
  # PATCH /v3/policies/​{policy_id}​
  # DELETE /v3/policies/​{policy_id}​
end

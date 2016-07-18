class OpenStackRubySDK::Keystone::Credential  
  include Peace::Model
  attr_accessor :blob, :id, :links, :project_id, :type, :user_id
  # POST /v3/credentials
  # GET /v3/credentials
  # GET /v3/credentials/​{credential_id}​
  # PATCH /v3/credentials/​{credential_id}​
  # DELETE /v3/credentials/​{credential_id}​
end

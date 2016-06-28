class OpenStackRubySDK::Keystone::Oauth  
  include Peace::Model
  attr_accessor :id, :description, :links
  # POST /v3/OS-OAUTH1/consumers
  # GET /v3/OS-OAUTH1/consumers
  # GET /v3/OS-OAUTH1/consumers/​{consumer_id}​
  # PATCH /v3/OS-OAUTH1/consumers/​{consumer_id}​
  # DELETE /v3/OS-OAUTH1/consumers/​{consumer_id}​
  # POST /v3/OS-OAUTH1/request_token
  # POST /v3/OS-OAUTH1/access_token
  # GET /v3/OS-OAUTH1/users/​{user_id}​/access_tokens
  # GET /v3/OS-OAUTH1/users/​{user_id}​/access_tokens/​{access_token_id}​
  # DELETE /v3/OS-OAUTH1/users/​{user_id}​/access_tokens/​{access_token_id}​
  # GET /v3/OS-OAUTH1/users/​{user_id}​/access_tokens/​{access_token_id}​/roles
  # GET /v3/OS-OAUTH1/users/​{user_id}​/access_tokens/​{access_token_id}​/roles/​{role_id}​
  # POST /v3/auth/tokens
end

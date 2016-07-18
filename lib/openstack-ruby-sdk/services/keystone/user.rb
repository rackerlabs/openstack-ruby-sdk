class OpenStackRubySDK::Keystone::User  
  include Peace::Model
  attr_accessor :default_project_id, :description, :domain_id, :email, :enabled, :id, :links, :name
  # GET /v3/users
  # POST /v3/users
  # GET /v3/users/​{user_id}​
  # PATCH /v3/users/​{user_id}​
  # DELETE /v3/users/​{user_id}​
  # POST /v3/users/​{user_id}​/password
  # GET /v3/users/​{user_id}​/groups
  # GET /v3/users/​{user_id}​/projects
end

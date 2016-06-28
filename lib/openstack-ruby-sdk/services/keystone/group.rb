class OpenStackRubySDK::Keystone::Group  
  include Peace::Model
  attr_accessor :description, :domain_id, :id, :links, :name
  # POST /v3/groups
  # GET /v3/groups
  # GET /v3/groups/​{group_id}​
  # PATCH /v3/groups/​{group_id}​
  # DELETE /v3/groups/​{group_id}​
  # GET /v3/groups/​{group_id}​/users
  # PUT /v3/groups/​{group_id}​/users/​{user_id}​
  # HEAD /v3/groups/​{group_id}​/users/​{user_id}​
  # DELETE /v3/groups/​{group_id}​/users/​{user_id}​
end

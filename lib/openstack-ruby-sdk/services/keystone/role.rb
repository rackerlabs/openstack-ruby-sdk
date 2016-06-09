class OpenStackRubySDK::Keystone::Role < Peace::Model
  attr_accessor :id, :links, :name
  # POST /v3/roles
  # GET /v3/roles
  # GET /v3/roles/​{role_id}​
  # PATCH /v3/roles/​{role_id}​
  # DELETE /v3/roles/​{role_id}​
  # GET /v3/domains/​{domain_id}​/users/​{user_id}​/roles
  # PUT /v3/domains/​{domain_id}​/users/​{user_id}​/roles/​{role_id}​
  # HEAD /v3/domains/​{domain_id}​/users/​{user_id}​/roles/​{role_id}​
  # DELETE /v3/domains/​{domain_id}​/users/​{user_id}​/roles/​{role_id}​
  # GET /v3/domains/​{domain_id}​/groups/​{group_id}​/roles
  # PUT /v3/domains/​{domain_id}​/groups/​{group_id}​/roles/​{role_id}​
  # HEAD /v3/domains/​{domain_id}​/groups/​{group_id}​/roles/​{role_id}​
  # DELETE /v3/domains/​{domain_id}​/groups/​{group_id}​/roles/​{role_id}​
  # GET /v3/projects/​{project_id}​/users/​{user_id}​/roles
  # PUT /v3/projects/​{project_id}​/users/​{user_id}​/roles/​{role_id}​
  # HEAD /v3/projects/​{project_id}​/users/​{user_id}​/roles/​{role_id}​
  # DELETE /v3/projects/​{project_id}​/users/​{user_id}​/roles/​{role_id}​
  # GET /v3/projects/​{project_id}​/groups/​{group_id}​/roles
  # PUT /v3/projects/​{project_id}​/groups/​{group_id}​/roles/​{role_id}​
  # HEAD /v3/projects/​{project_id}​/groups/​{group_id}​/roles/​{role_id}​
  # DELETE /v3/projects/​{project_id}​/groups/​{group_id}​/roles/​{role_id}​
  # GET /v3/role_assignments
end

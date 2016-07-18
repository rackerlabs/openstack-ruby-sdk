class OpenStackRubySDK::Keystone::Project
  include Peace::Model
  attr_accessor :description, :domain_id, :enabled, :id, :links, :name, :parent_id, :is_domain
  # GET /v3/projects
  # POST /v3/projects
  # GET /v3/projects/​{project_id}​
  # PATCH /v3/projects/​{project_id}​
  # DELETE /v3/projects/​{project_id}​
  # PATCH /v3/projects/​{project_id}​/cascade
  # DELETE /v3/projects/​{project_id}​/cascade
end

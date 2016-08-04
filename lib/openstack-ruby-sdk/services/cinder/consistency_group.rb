class OpenStackRubySDK::Cinder::ConsistencyGroup
  include Peace::Model

  attr_accessor :availability_zone, :created_at, :description, :id, :name, :status, :volume_types

  rackspace_api_path "consistencygroups"
  json_key_name :consistencygroup

  # TODO: Test this once we can get Admin access (via policy.json)

  # GET /v2/​{tenant_id}​/consistencygroups
  # POST /v2/​{tenant_id}​/consistencygroups
  # GET /v2/​{tenant_id}​/consistencygroups/detail
  # POST /v2/​{tenant_id}​/consistencygroups/create_from_src
  # GET /v2/​{tenant_id}​/consistencygroups/​{consistencygroup_id}​
  # POST /v2/​{tenant_id}​/consistencygroups/​{consistencygroup_id}​/delete
  # PUT /v2/​{tenant_id}​/consistencygroups/​{consistencygroup_id}​/update
end

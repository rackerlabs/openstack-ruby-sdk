class OpenStackRubySDK::Heat::SoftwareConfiguration < Peace::Model
  attr_accessor :config, :creation_time, :group, :id, :inputs, :name, :options, :outputs
  # POST /v1/​{tenant_id}​/software_configs
  # GET /v1/​{tenant_id}​/software_configs/​{config_id}​
  # DELETE /v1/​{tenant_id}​/software_configs/​{config_id}​
  # GET /v1/​{tenant_id}​/software_deployments
  # POST /v1/​{tenant_id}​/software_deployments
  # GET /v1/​{tenant_id}​/software_deployments/metadata/​{server_id}​
  # GET /v1/​{tenant_id}​/software_deployments/​{deployment_id}​
  # PUT /v1/​{tenant_id}​/software_deployments/​{deployment_id}​
  # DELETE /v1/​{tenant_id}​/software_deployments/​{deployment_id}​
end

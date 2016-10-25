class OpenStackRubySDK::Nova::Action
  include Core::Model
  attr_accessor :action, :instance_uuid, :message, :project_id, :request_id, :start_time, :user_id, :server_id

  belongs_to :server
  api_path "/servers/{{server_id}}/os-instance-actions"

end

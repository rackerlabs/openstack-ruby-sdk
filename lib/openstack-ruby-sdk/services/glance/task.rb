class OpenStackRubySDK::Glance::Task  
  include Core::Model
  attr_accessor :id, :type, :status
  # POST /v2/tasks
  # GET /v2/tasks
  # GET /v2/tasks/​{task_id}​
end

class OpenStackRubySDK::Glance::Task  
  include Peace::Model
  attr_accessor :id, :type, :status
  # POST /v2/tasks
  # GET /v2/tasks
  # GET /v2/tasks/​{task_id}​
end

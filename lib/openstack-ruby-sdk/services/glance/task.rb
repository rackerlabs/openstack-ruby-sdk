class OpenStackRubySDK::Glance::Task < Peace::Model
  attr_accessor :id, :type, :status
  # POST /v2/tasks
  # GET /v2/tasks
  # GET /v2/tasks/​{task_id}​
end

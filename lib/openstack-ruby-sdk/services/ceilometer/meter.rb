class OpenStackRubySDK::Ceilometer::Meter
  
  include Core::Model
  attr_accessor :meter_id, :name, :project_id, :resource_id, :source, :type, :unit, :user_id

  # "GET /v2/meters",
  # "GET /v2/meters/(meter_name)",
  # "POST /v2/meters/(meter_name)",
  # "GET /v2/meters/(meter_name)/statistics",
end

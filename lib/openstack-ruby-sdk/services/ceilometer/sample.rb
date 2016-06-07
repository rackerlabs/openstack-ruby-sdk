class OpenStackRubySDK::Ceilometer::Sample < Peace::Model
  attr_accessor :id, :metadata, :meter, :project_id, :recorded_at, :resource_id, :source, :timestamp, :type, :unit, :user_id, :volume
  
  # "GET /v2/samples",
  # "GET /v2/samples/(sample_id)",
end

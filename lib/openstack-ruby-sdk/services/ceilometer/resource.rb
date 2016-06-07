class OpenStackRubySDK::Ceilometer::Resource < Peace::Model
  attr_accessor :first_sample_timestamp, :last_sample_timestamp, :links, :metadata, :project_id, :resource_id, :source, :user_id

  # "GET /v2/resources",
  # "GET /v2/resources/(resource_id)"
end

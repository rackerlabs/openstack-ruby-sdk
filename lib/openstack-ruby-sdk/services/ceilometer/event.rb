class OpenStackRubySDK::Ceilometer::Event
  
  include Core::Model
  attr_accessor :event_type, :generated, :message_id, :raw, :traits
end

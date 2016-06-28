class OpenStackRubySDK::Ceilometer::Event
  
  include Peace::Model
  attr_accessor :event_type, :generated, :message_id, :raw, :traits
end

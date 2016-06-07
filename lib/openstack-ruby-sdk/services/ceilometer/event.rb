class OpenStackRubySDK::Ceilometer::Event < Peace::Model
  attr_accessor :event_type, :generated, :message_id, :raw, :traits
end

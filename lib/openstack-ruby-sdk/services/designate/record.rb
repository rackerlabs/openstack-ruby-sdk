class OpenStackRubySDK::Designate::Record 
  include Peace::Model
  attr_accessor :id, :name, :value, :ttl, :type, :priority, :created, :updated

	def details; end
end

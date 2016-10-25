class OpenStackRubySDK::Nova::Metadatum  
  include Core::Model
  has_many :metadatum_items
  
  attr_accessor :id, :value
end

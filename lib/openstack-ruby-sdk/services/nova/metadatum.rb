class OpenStackRubySDK::Nova::Metadatum < Peace::Model
  has_many :metadatum_items
  
  attr_accessor :id, :value
end

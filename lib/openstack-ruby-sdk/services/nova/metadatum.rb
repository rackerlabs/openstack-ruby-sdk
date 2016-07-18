class OpenStackRubySDK::Nova::Metadatum  
  include Peace::Model
  has_many :metadatum_items
  
  attr_accessor :id, :value
end

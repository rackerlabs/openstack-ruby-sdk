class OpenStackRubySDK::Poppy::SslCertificate 
  include Peace::Model
  attr_accessor :cert_type, :domain_name, :flavor_id, :project_id
  belongs_to :flavor
  belongs_to :project
end

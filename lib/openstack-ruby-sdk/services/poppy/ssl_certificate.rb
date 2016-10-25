class OpenStackRubySDK::Poppy::SslCertificate 
  include Core::Model
  attr_accessor :cert_type, :domain_name, :flavor_id, :project_id
  belongs_to :flavor
  belongs_to :project
end

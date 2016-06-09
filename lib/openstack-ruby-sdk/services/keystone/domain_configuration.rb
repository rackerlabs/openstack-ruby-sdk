class OpenStackRubySDK::Keystone::DomainConfiguration < Peace::Model
  attr_accessor :identity, :ldap
  # GET /v3/domains/​{domain_id}​/config
  # PATCH /v3/domains/​{domain_id}​/config
  # DELETE /v3/domains/​{domain_id}​/config
  # GET /v3/domains/​{domain_id}​/config/​{group}​
  # PATCH /v3/domains/​{domain_id}​/config/​{group}​
  # DELETE /v3/domains/​{domain_id}​/config/​{group}​
  # GET /v3/domains/​{domain_id}​/config/​{group}​/​{option}​
  # PATCH /v3/domains/​{domain_id}​/config/​{group}​/​{option}​
  # DELETE /v3/domains/​{domain_id}​/config/​{group}​/​{option}​
end

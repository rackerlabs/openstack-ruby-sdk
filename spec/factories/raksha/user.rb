FactoryGirl.define do
  factory :raksha_user do
    agent_version ''
    architecture ''
    backup_container ''
    backup_vault_size ''
    cleanup_allowed ''
    datacenter ''
    flavor ''
    ip_address ''
    is_disabled ''
    is_encrypted ''
    machine_agent_id ''
    machine_name ''
    operating_system ''
    operating_system_version ''
    public_key ''
    status ''
    time_of_last_successful_backup ''
    use_service_net ''
  end
end

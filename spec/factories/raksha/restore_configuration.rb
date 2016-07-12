FactoryGirl.define do
  factory :raksha_restore_configuration do
    backup_configuration_id ''
    backup_configuration_name ''
    backup_data_center ''
    backup_flavor ''
    backup_id ''
    backup_machine_id ''
    backup_machine_name ''
    backup_restore_point ''
    destination_machine_id ''
    destination_machine_name ''
    destination_path ''
    encrypted_password ''
    is_encrypted ''
    overwrite_files ''
    public_key ''
    restore_id ''
    restore_state_id ''
  end
end

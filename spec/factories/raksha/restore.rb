FactoryGirl.define do
  factory :raksha_restore do
    restore_id ''
    backup_id ''
    destination_machine_id ''
    overwrite_files ''
    backup_configuration_id ''
    backup_configuration_name ''
    backup_restore_point ''
    backup_machine_id ''
    backup_machine_name ''
    backup_flavor ''
    destination_machine_name ''
    destination_path ''
    backup_data_center ''
    is_encrypted ''
    encrypted_password ''
    public_key ''
    restore_state_id ''
  end
end

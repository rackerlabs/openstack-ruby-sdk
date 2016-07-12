FactoryGirl.define do
  factory :glance_metadata_definition_property do
    hw_disk_bus ''
    hw_machine_type ''
    hw_qemu_guest_agent ''
    hw_rng_model ''
    hw_scsi_model ''
    hw_video_model ''
    hw_video_ram ''
    hw_vif_model ''
    os_command_line ''
  end
end

FactoryGirl.define do
  factory :cinder_backup do
    availability_zone ''
    container ''
    created_at ''
    description ''
    fail_reason ''
    has_dependent_backups ''
    id ''
    is_incremental ''
    links ''
    name ''
    object_count ''
    size ''
    status ''
    volume_id ''
  end
end

class OpenStackRubySDK::Cinder::VolumeType
  include Peace::Model
  attr_accessor :description, :extra_specs, :id, :name

  attr_with_alias :is_public, "os-volume-type-access:is_public"
  json_key_name :volume_types
  rackspace_api_path "types"

  def revoke_access!(project_id)
    data = {"removeProjectAccess": { "project": "#{project_id}" }}
    url  = "#{self.url}/action"
    Peace::Request.post(url, data)
  end

  def grant_access!(project_id)
    data = {"addProjectAccess": { "project": "#{project_id}" }}
    url  = "#{self.url}/action"
    Peace::Request.post(url, data)
  end
end

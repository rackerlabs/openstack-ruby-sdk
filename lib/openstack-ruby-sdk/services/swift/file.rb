class OpenStackRubySDK::Swift::File
  include Core::Model
  attr_accessor :id, :content_length, :content_type, :content_disposition, :etag, :last_modified, :access_control_allow_origin, :origin, :content_encoding, :delete_at, :delete_after

  attr_with_alias :content_length, 'Content-Length'
  attr_with_alias :content_type, 'Content-Type'
  attr_with_alias :bytes, 'Content-Length'
  attr_with_alias :bytes, 'Content-Length'
  attr_with_alias :content_disposition, 'Content-Disposition'
  attr_with_alias :etag, 'Etag'
  attr_with_alias :last_modified, 'Last-Modified'
  attr_with_alias :access_control_allow_origin, 'Access-Control-Allow-Origin'
  attr_with_alias :content_encoding, 'Content-Encoding'
  attr_with_alias :delete_at, 'X-Delete-At'
  attr_with_alias :delete_after, 'X-Delete-After'

  def copy; end
  def delete_static; end
  def delete_multiples; end
  def https_url; end
  def http_url; end
  def head; end
  def put; end
  def put_manifest; end
  def put_dynamic_obj_manifest; end
  def put_static_obj_manifest; end
  def post_set_meta_temp_url_key; end
  def extract_archive; end
end

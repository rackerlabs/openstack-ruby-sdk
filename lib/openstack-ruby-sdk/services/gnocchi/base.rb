class OpenStackRubySDK::Gnocchi 
  include Peace::Service

  def initialize
  end

  def limits; end
  def get_data_for_metrics; end
  def query_for_a_set_of_metrics; end
  def get_aggregated_set_of_metrics; end
  def get_annotation; end
  def get_data_for_list_of_metrics; end
  def query_limits; end
  def get_limits; end
  def send_metrics; end
  def send_aggregated_metrics; end
  def send_aggregated_enum_metrics; end
  def send_annotation; end
end

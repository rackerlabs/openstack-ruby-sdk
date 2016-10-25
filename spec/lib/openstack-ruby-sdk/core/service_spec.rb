require 'spec_helper'

module Testing
  class Network
    include Core::Service
  end
end

describe Core::Service do
  let(:service){ Testing::Network.new }

  it 'knows the service_name' do
    expect(service.class.service_name).to eq :network
  end

end

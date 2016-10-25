require 'spec_helper'

module Testing
  module Compute
    class Server
      include Core::Model

      attr_accessor :foo
      attr_with_alias :bandwidth, 'rax-bandwidth:bandwidth'
    end
  end
end

describe Core::Model do
  let(:model){ Testing::Compute::Server.new }

  it 'knows the resource_name at object level' do
    expect(model.resource_name).to eq 'server'
  end

  it 'knows the resource_name at class level' do
    expect(model.class.resource_name).to eq 'server'
  end

  it 'knows how to serialize into json' do
    expect(model.to_json).to eq "{\"server\":{\"foo\":null,\"rax-bandwidth:bandwidth\":null}}"
  end

end

require 'pry'
require 'pathname'
require 'active_support/all'

require "#{Dir.pwd}/lib/openstack-ruby-sdk"
Dir.glob('lib/**/*.rb'){ |f| require_relative f }

Dir.glob("#{Dir.pwd}/lib/openstack-ruby-sdk/services/**/*.rb").each do |file|
  next if file =~ /base.rb/

  spec_path = file.gsub('lib/openstack-ruby-sdk/services', 'spec/services')
  bits      = spec_path.split('/')
  service   = bits[-2].to_sym
  object    = bits[-1][0...-3]
  klass     = "OpenStackRubySDK::#{service.to_s.classify}::#{object.classify}"
  path      = Pathname.new(spec_path)

  if klass =~ /Datum/
    klass.gsub!('Datum', 'Data')
  end

  obj = klass.constantize.new

  `mkdir -p #{path.dirname}`

file = <<-EOF
require 'spec_helper'

describe #{klass} do
  let(:klass){ #{klass} }
  let(:obj){ klass.new }

  describe "Validation" do
    it 'requires these attributes'
  end

  describe "Endpoints" do
    it 'knows the :index endpoint' do
			expect(klass.endpoints.index.url).to eq("#{obj.class.collection_url}")
			expect(klass.endpoints.index.method).to eq(:get)
		end

    it 'knows the :show endpoint' do
			expect(obj.endpoints.show.url).to eq("#{obj.url}")
			expect(obj.endpoints.show.method).to eq(:get)
		end

    it 'knows the :create endpoint' do
			expect(klass.endpoints.create.url).to eq("#{obj.class.collection_url}")
			expect(klass.endpoints.create.method).to eq(:post)
		end

    it 'knows the :update endpoint' do
			expect(obj.endpoints.update.url).to eq("#{obj.url}")
			expect(obj.endpoints.update.method).to eq(:put)
		end

    it 'knows the :destroy endpoint' do
			expect(obj.endpoints.destroy.url).to eq("#{obj.url}")
			expect(obj.endpoints.destroy.method).to eq(:delete)
		end
	end
end
EOF

  File.write(spec_path.gsub('.rb', '_spec.rb'), file)
  print '.'
end

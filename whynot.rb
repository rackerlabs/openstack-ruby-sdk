require 'pry'
require 'pathname'
require 'active_support/all'

Dir.glob("#{Dir.pwd}/lib/openstack-ruby-sdk/services/**/*.rb").each do |file|
  spec_path = file.gsub('lib/openstack-ruby-sdk/services', 'spec/services')
  bits      = spec_path.split('/')
  service   = bits[-2].to_sym
  object    = bits[-1][0...-3]
  klass     = "OpenStackRubySDK::#{service.to_s.classify}::#{object.classify}"
  path      = Pathname.new(spec_path)

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
			expect(klass.endpoints.index.url).to eq("")
			expect(klass.endpoints.index.method).to eq("GET")
			expect(klass.endpoints.index.payload).to eq({})
			expect(klass.endpoints.index.headers).to eq([])
		end

    it 'knows the :show endpoint' do
			expect(obj.endpoints.show.url).to eq("")
			expect(obj.endpoints.show.method).to eq("GET")
			expect(obj.endpoints.show.payload).to eq({})
			expect(obj.endpoints.show.headers).to eq([])
		end

    it 'knows the :create endpoint' do
			expect(klass.endpoints.create.url).to eq("")
			expect(klass.endpoints.create.method).to eq("POST")
      expect(klass.endpoints.create.payload).to eq({})
			expect(klass.endpoints.create.headers).to eq([])
		end

    it 'knows the :update endpoint' do
			expect(obj.endpoints.update.url).to eq("")
			expect(obj.endpoints.update.method).to eq("PUT")
			expect(obj.endpoints.update.payload).to eq({})
			expect(obj.endpoints.update.headers).to eq([])
		end

    it 'knows the :destroy endpoint' do
			expect(obj.endpoints.destroy.url).to eq("")
			expect(obj.endpoints.destroy.method).to eq("DELETE")
			expect(obj.endpoints.destroy.payload).to eq({})
			expect(obj.endpoints.destroy.headers).to eq([])
		end
	end
end
EOF

  File.write(spec_path.gsub('.rb', '_spec.rb'), file)
  print '.'
end


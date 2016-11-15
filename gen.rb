require 'pry'
require 'pathname'
require 'active_support/all'

services = {}

Dir.glob("#{Dir.pwd}/lib/openstack-ruby-sdk/services/**/*.rb").each do |file|
  next if file =~ /base.rb/
  
  spec_path = file.gsub('lib/openstack-ruby-sdk/services', 'spec/lib/openstack-ruby-sdk/services')
  bits      = spec_path.split('/')
  service   = bits[-2].to_sym
  object    = bits[-1][0...-3]
  klass     = "OpenStackRubySDK::#{service.to_s.classify}::#{object.classify}"
  path      = Pathname.new(spec_path)
  obj       = path.basename.to_s.gsub!('.rb', '')

  `mkdir -p #{path.dirname}`

file = <<-EOF
require 'spec_helper'

describe #{klass} do
  let(:#{obj}){ #{klass}.new }

  it 'gets an index' do
    expect(#{klass}.all).to eq([])
  end

  it 'gets its self' do
    expect(#{klass}.find(#{obj}.id)).to eq(#{obj})
  end

  it 'creates its self' do
    #{obj}.name = Time.now.usec.to_s
    expect(#{obj}.save).to eq(true)
  end

  it 'updates its self' do
    #{obj}.name = Time.now.usec.to_s
    expect(#{obj}.save).to eq(true)
    #{obj}.name = Time.now.usec.to_s
    expect(#{obj}.save).to eq(true)
  end

  it 'deletes its self' do
    expect(#{obj}.destroy).to eq(true)
  end
end
EOF

  File.write(spec_path.gsub('.rb', '_spec.rb'), file)
  print '.'
end

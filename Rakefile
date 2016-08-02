require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Run the OpenStack test suite"
task :openstack do
  exec "OPENSTACK=true rspec"
end

desc "Start a terminal with this gem preloaded."
task :console do
  exec "SDK='openstack' irb -r openstack-ruby-sdk -I ./lib"
end

# jimweirich rerun cinder volume_type
desc "Erase VCR cassette and re-run spec"
task :rerun do
  require 'active_support/all'

  service = ARGV[1]
  model   = ARGV[2]

  `rm -rf spec/vcr/OpenStackRubySDK_#{service.classify}_#{model.classify}`
  puts `rspec --color --tty ./spec/lib/openstack-ruby-sdk/services/#{service}/#{model}_spec.rb`

  # These must be here otherwise each ARGV will invoke as a task.
  task service.to_sym do ; end
  task model.to_sym do ; end
end

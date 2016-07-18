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

require 'rake'
require 'hanami/rake_tasks'

begin
  require 'rspec/core/rake_task'
  rad_gem = Gem::Specification.find_by_name('rspec_api_documentation')
  load "#{rad_gem.gem_dir}/lib/tasks/docs.rake"
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError
end

require "bundler/gem_tasks"
require "yard"
require "yard/rake/yardoc_task"

namespace :doc do
  desc "Generate YARD docs"
  YARD::Rake::YardocTask.new(:generate) do |t|
    t.files   = %w(lib/**/*.rb - README.md)
  end
end
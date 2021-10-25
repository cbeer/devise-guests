require "rubygems"
require "bundler"
require "bundler/gem_tasks"
require "standard/rake"

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems"
  exit e.status_code
end

task default: :ci

require "rspec/core/rake_task"
desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  if ENV["COVERAGE"] && RUBY_VERSION =~ (/^1.8/)
    t.rcov = true
    t.rcov_opts = %w[--exclude spec\/*,gems\/*,ruby\/* --aggregate coverage.data]
  end
end

require "yard"
YARD::Rake::YardocTask.new do |t|
  t.options = ["--readme", "README.md"]
end

desc "Continuous Integration build"
task :ci do
  Rake::Task["spec"].invoke
  Rake::Task["yard"].invoke
end

require 'rubygems'
require 'bundler/setup'

if ENV['COVERAGE'] and RUBY_VERSION =~ /^1.9/
  require 'simplecov'
  SimpleCov.start
end

require 'combustion'
require 'capybara/rspec'

require 'devise'
require 'devise-guests'
Combustion.initialize!(:active_record,:action_mailer)

require 'rspec/rails'
require 'capybara/rails'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
end


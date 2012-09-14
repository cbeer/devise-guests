require 'rubygems'
require 'bundler'

Bundler.require :default, :development

if ENV['COVERAGE'] and RUBY_VERSION =~ /^1.9/
  require 'simplecov'
  SimpleCov.start
end

require 'capybara/rspec'

Combustion.initialize!

require 'rspec/rails'
require 'capybara/rails'

require 'devise-guests'

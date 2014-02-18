require 'rails/generators/active_record'
require 'generators/devise/orm_helpers'

module ActiveRecord
  module Generators
    class DeviseGuestsGenerator < ActiveRecord::Generators::Base
      include Devise::Generators::OrmHelpers
      source_root File.expand_path("../templates", __FILE__)

      def copy_devise_migration
          migration_template "migration_existing.rb", "db/migrate/add_devise_guests_to_#{table_name}.rb"
      end

      def migration_data
<<RUBY
      ## Database authenticatable
      t.boolean :guest, :default => false
RUBY
      end
    end
  end
end
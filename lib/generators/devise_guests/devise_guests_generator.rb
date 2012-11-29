module DeviseGuests
  module Generators
    class DeviseGuestsGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      namespace "devise_guests"
      source_root File.expand_path("../templates", __FILE__)

      desc "Generates devise guests attributes into a model with the given NAME"

      hook_for :orm

      def do_nothing

      end
    end
  end
end
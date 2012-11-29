require 'rails'
require 'devise'

module DeviseGuests
  class Engine < ::Rails::Engine

    initializer "devise_guests.add_helpers" do
      Devise.include_helpers(DeviseGuests::Controllers)
      Devise.helpers << DeviseGuests::Controllers::Helpers
    end

     # This makes our rake tasks visible.
    rake_tasks do
      Dir.chdir(File.expand_path(File.join(File.dirname(__FILE__), '..'))) do
        Dir.glob(File.join('railties', '*.rake')).each do |railtie|
          load railtie
        end
      end
    end
    
  end
end

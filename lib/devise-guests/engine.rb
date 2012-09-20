require 'rails'
require 'devise'

module DeviseGuests
  class Engine < ::Rails::Engine

    initializer "devise_guests.add_helpers" do
      Devise.include_helpers(DeviseGuests::Controllers)
      Devise.helpers << DeviseGuests::Controllers::Helpers
    end
  end
end

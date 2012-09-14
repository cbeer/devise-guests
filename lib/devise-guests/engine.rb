require 'rails'
require 'devise'

module DeviseGuests
  class Engine < ::Rails::Engine

    initializer "devise_guests.url_helpers" do
      Devise.include_helpers(DeviseGuests::Controllers)
    end
  end
end

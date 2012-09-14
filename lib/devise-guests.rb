require 'devise'

module DeviseGuests
  require 'devise-guests/version'

  module Controllers
    autoload :Helpers, 'devise-guests/controllers/helpers'
    autoload :UrlHelpers, 'devise-guests/controllers/url_helpers'
  end

  require 'devise-guests/engine'
end

Devise.setup do |config|
  require 'devise/orm/active_record'
  require 'devise-guests'

  config.helpers << DeviseGuests::Controllers::Helpers
end

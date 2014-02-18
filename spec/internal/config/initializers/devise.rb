Devise.setup do |config|
  require 'devise/orm/active_record'
  require 'devise-guests'

  config.helpers << DeviseGuests::Controllers::Helpers
  config.secret_key = '71da52cff5ef1a77c9ccdc5153993e0e58054c288c86e005d9f7eca6ac7a9279825c7903f1de5960e900543ab0cf7f85b6d307c43b53719bebcdb9cdcfe8b7e7'
end

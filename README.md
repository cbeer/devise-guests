# Devise Guests
[![Build Status](https://travis-ci.org/cbeer/devise-guests.png?branch=master)](https://travis-ci.org/cbeer/devise-guests)

A drop-in guest user implementation for devise

(I'm using "user" to mean my devise model, but you should be able to use any model you want, just like devise)

## Installation

```ruby
# install devise first
# gem install devise
# rails g devise:install
# rails g devise User

gem install devise-guests
rails g devise_guests User
```

## Usage

```ruby
# Where you might use current_user; now you can use

current_or_guest_user

# which returns

current_user # (for logged in users)

=> User<id: 1, email: ...>
# or 

guest_user # ( for anonymous users)

=> User<id: nil, email: guest_RANDOMENOUGHSTRING_@example.com, guest: true>

```

### Transferring Guest to User on Login

During the login process you may want to transfer things from your guest user to the account the logged into.
To do so, modify your ApplicationController like so:

```ruby
define_callbacks :logging_in_user
set_callback :logging_in_user, :before, :transfer_guest_to_current_user

private
def transfer_guest_to_current_user
  # At this point you have access to:
  #   * current_user - the user they've just logged in as
  #   * guest_user - the guest user they were previously identified by
  # 
  # After this block runs, the guest_user will be destroyed!
  
  if current_user.cart
    guest_user.cart.line_items.update_all(cart_id: current_user.cart.id)
  else
    guest_user.cart.update!(user: current_user)
  end
end
```

### Custom attribute

If you have added additional authentication_keys, or have other attributes on your Devise model that you need to set
when creating a guest user, you can do so by overriding the set_guest_user_params method in your ApplicationController:

```ruby
private
def guest_user_params
  { site_id: current_site.id }
end
```

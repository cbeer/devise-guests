# Devise Guests
[![Gem Version](https://badge.fury.io/rb/devise-guests.svg)](https://badge.fury.io/rb/devise-guests)
[![Tests](https://github.com/cbeer/devise-guests/actions/workflows/tests.yml/badge.svg)](https://github.com/cbeer/devise-guests/actions/workflows/tests.yml)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

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

=> User<id: 2, email: guest_RANDOMENOUGHSTRING_@example.com, guest: true>

```

### Transferring Guest to User on Login

During the login process you may want to transfer things from your guest user to the account the logged into.
To do so, add the following method to your ApplicationController:

```ruby
private
def transfer_guest_to_user
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

### Non-standard authentication keys

By default Devise will use `:email` as the authentication key for your model. If for some reason you have modified your
Devise config to use an alternative attribute (such as `:phone_number`) you will need to provide a method to generate
the value of this attribute for any guest users which are created.

Sticking with the `:phone_number` example, you should define the following method in your `application_controller.rb`:

```ruby
private
def guest_phone_number_authentication_key(key)
  key &&= nil unless key.to_s.match(/^guest/)
  key ||= "guest_447" + 9.times.map { SecureRandom.rand(0..9) }.join
end
```

Validations are skipped when creating guest users, but if you need to rely on future modifications to the guest record
passing validations, then you should ensure that this default value for guests is generated in such a way as to be
valid.

### Prevent deletion of guest records

By default, when signing in from a guest account to an authenticated account, the guest user is destroyed. You have an
opportunity through the `logging_in_user` callback (or `logging_in_MODEL` if you're not using `User`) to transfer data
from the guest to the main account before destruction occurs.

However, for some situations such as guest-checkout, you may desire that any guest account which makes a purchase does
not get destroyed. In that case you can use the `skip_destroy_guest_user` method to identify when to skip deleting these
records. By default this method returns `false`, indicating that every record is acceptable for destruction, but you
could use something like the following to optionally prevent it:

```ruby
def skip_destroy_guest_user
  guest_user.orders.any?
end
```

### Customize Email Domain used for generate Guest User

By default, the domain used for create a new User is @example.com but you can customize using .env and set your prefer
domain with:

```ruby
ENV[DEVISE_GUEST_EMAIL_DOMAIN] = '@example.com'
```


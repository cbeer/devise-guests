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

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

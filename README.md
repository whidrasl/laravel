# Capistrano::laravel

Deploy Laravel 5.1 applications with Capistrano v3.*

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano', '~> 3.0.0'
gem 'capistrano-laravel51'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-laravel51

## Usage

Require the module in your `Capfile`:

```ruby
require 'capistrano/laravel51'
```

### Configuration

The gem makes the following configuration variables available (shown with defaults)

```ruby
set :laravel_roles, :all
set :laravel_artisan_flags, "--env=production"
set :laravel_server_user, "deploy"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

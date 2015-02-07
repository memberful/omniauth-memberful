# OmniAuth::Memberful

OmniAuth strategy to authenticate users over the Memberful API in Rails (or Rack)
applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-memberful'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-memberful

## Usage

As with other OmniAuth strategies, you'll need to setup the OmniAuth middleware and
a callback to receive the OmniAuth credentials once a user has been authenticated.

You can enable `Omniauth::Memberful` by using the `OmniAuth::Builder` to insert the strategy middleware
with your Memberful credentials. Visit your Memberful Settings page to generate
a "Custom App" with a name and endpoint in your application for the OAuth callback. You'll get use
the generated identifier and secret key in your OmniAuth setup with

In Rails:

```yaml
# config/secrets.yml
development:
  memberful_app_identifier: aaaaaaaaa
  memberful_app_secret: bbbbbbbbbbbbbbbbbbb
  memberful_site: https://yoursite.memberful.com
```

```ruby
# config/initializers/omniauth.rb
require "omniauth-memberful"

secrets = Rails.application.secrets
Rails.application.config.middleware.use OmniAuth::Builder do
  provider OmniAuth::Strategies::Memberful,
    secrets.memberful_app_identifier,
    secrets.memberful_app_secret,
    client_options: { site: secrets.memberful_site }
end
```

Check out the example app at [rossta/memberful-rails-example](github.com/rossta/memberful-rails-example) for more info.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/omniauth-memberful/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

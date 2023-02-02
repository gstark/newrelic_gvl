# NewRelic GVL Stats

Ruby 3.2.0 allows for tracking of GVL status. This gem utilizes that API via [gvltools](https://github.com/Shopify/gvltools) to report GVL status for Sidekiq jobs and Rack requests.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add newrelic_gvl

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install newrelic_gvl

## Usage

For rails:

```
config.middleware.use NewrelicGvl::Rack::Middleware
```

For sidekiq:

```
Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add NewrelicGvl::Sidekiq::Middleware
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gstark/newrelic_gvl.

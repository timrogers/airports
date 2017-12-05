# Airports

[![Gem Version](https://badge.fury.io/rb/airports.svg)](http://badge.fury.io/rb/airports) [![Build Status](https://travis-ci.org/timrogers/airports.svg)](https://travis-ci.org/timrogers/airports)

Airports gives you access to data on airports around the world.

## Usage

Install the gem *(Ruby 2.1.0 and later only)*:

```bash
$ gem install airports
```

You can then look up an airport by its IATA code (e.g. `LHR` for London Heathrow) using `Airports.find_by_iata_code`, which returns an object with a bunch of accessors like `name` and `city`:

```ruby
Airports.find_by_iata_code("LHR")
=> #<Airports::Airport:0x007fd9a1bbd550 @name="Heathrow", @city="London", @country="United Kingdom", @iata="LHR", @icao="EGLL", @latitude="51.4775", @longitude="-0.461389", @altitude="83", @timezone="0", @dst="E">
```

A couple of other methods provide access to aggregate data.

You can call `Airports.iata_codes` for a list of valid IATA codes, perfect for Rails validations:

```ruby
validates :destination_airport, inclusion: { in: Airports.iata_codes, message: "is not a valid airport" }
```

Or `Airport.all` will provide `Airports::Airport` objects representing all the airports the gem knows about.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/timrogers/airports. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## Acknowledgements

Big thanks to [OpenFlights](http://openflights.org) for collecting and making this data available. Check out their website for additional data about airlines, routes etc.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


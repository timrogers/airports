# Airports

[![Gem Version](https://badge.fury.io/rb/airports.svg)](http://badge.fury.io/rb/airports)

Airports gives you access to data on airports around the world from your Ruby applications.

It's based on data from [OpenFlights](http://openflights.org), with a bit of massaging on the way (dropping airports without an IATA code, giving Doha its IATA code and adding `HYD` and `BER` which are missing entirely).

## Usage

Install the gem by adding it to your Gemfile:

```ruby
gem "airports", "~> 1.11.0"
```

You can then look up an airport by its IATA code (e.g. `LHR` for London Heathrow) using `Airports.find_by_iata_code`, which returns an object with a bunch of accessors like `name` and `city`:

```ruby
Airports.find_by_iata_code("LHR")
=> #<Airports::Airport:0x00007fdbd1df68d0 @name="London Heathrow Airport", @city="London", @country="United Kingdom", @iata="LHR", @icao="EGLL", @latitude="51.4706", @longitude="-0.461941", @altitude="83", @timezone="0", @dst="E", @tz_name="Europe/London">
```

You can also look up an airport by its ICAO code.

```ruby
Airports.find_by_icao_code("KCRG")
=> #<Airports::Airport:0x00007fdbd1d955d0 @name="Jacksonville Executive at Craig Airport", @city="Jacksonville", @country="United States", @iata="CRG", @icao="KCRG", @latitude="30.3362998962", @longitude="-81.51439666750001", @altitude="41", @timezone="\\N", @dst="\\N", @tz_name="\\N">
```

A couple of other methods provide access to aggregate data.

You can call `Airports.iata_codes` for a list of valid IATA codes, perfect for Rails validations:

```ruby
validates :destination_airport, inclusion: { in: Airports.iata_codes, message: "is not a valid airport" }
```

Or `Airports.all` will provide `Airports::Airport` objects representing all the airports the gem knows about.

## Performance Benchmarks

This section provides comprehensive performance metrics for the airports gem to help users understand the performance characteristics and make informed decisions about usage in production applications.

### Methodology

Performance benchmarks should be conducted using the following standardized methodology to ensure consistency and reproducibility:

**Environment Specifications:**
- **Hardware:** Standard benchmark should use a modern development machine (e.g., Intel i7/i9 or AMD Ryzen equivalent, 16GB+ RAM, SSD storage)
- **Operating System:** Ubuntu 20.04+ LTS or macOS 12+ or Windows 10+
- **Ruby Version:** Latest stable Ruby version (currently 3.2+) and the minimum supported version (2.6+)
- **Dataset:** Current airports.json file (6,076 airports, ~1.4MB)

**Test Scenarios:**
- **Cold Start:** Initial library load and data parsing from fresh Ruby process
- **Warm Queries:** Repeated queries after initial load (cached performance)
- **Concurrent Access:** Multiple threads performing simultaneous queries
- **Memory Profiling:** Peak and sustained memory usage patterns
- **Large Dataset Operations:** Performance with full airport dataset operations

### Performance Results

*Note: No official benchmarks have been conducted yet. The following tables are placeholders for future benchmark data.*

#### Startup and Data Loading Performance

| Metric | Ruby 3.2 | Ruby 3.1 | Ruby 3.0 | Ruby 2.6 (min) |
|--------|----------|----------|----------|-----------------|
| Initial load time | TBD | TBD | TBD | TBD |
| JSON parsing time | TBD | TBD | TBD | TBD |
| Object instantiation | TBD | TBD | TBD | TBD |
| Total startup time | TBD | TBD | TBD | TBD |

#### Query Performance (operations per second)

| Operation | Single Query | 1,000 Queries | 10,000 Queries | Notes |
|-----------|--------------|---------------|-----------------|-------|
| `find_by_iata_code` | TBD | TBD | TBD | Most common operation |
| `find_by_icao_code` | TBD | TBD | TBD | Linear search through all airports |
| `find_all_by_city_name` | TBD | TBD | TBD | Returns multiple results |
| `find_all_by_country_name` | TBD | TBD | TBD | Returns multiple results |
| `all` (first call) | TBD | TBD | TBD | Instantiates all airport objects |
| `all` (cached) | TBD | TBD | TBD | Returns cached results |

#### Memory Usage

| Operation | Initial Memory | Peak Memory | Sustained Memory | Notes |
|-----------|---------------|-------------|------------------|-------|
| Library load | TBD | TBD | TBD | Before any queries |
| After `Airports.all` | TBD | TBD | TBD | All objects instantiated |
| During heavy querying | TBD | TBD | TBD | Realistic usage pattern |

### Version Comparisons

*This section will compare performance across different versions of the airports gem when benchmarks become available.*

| Version | Load Time | Query Performance | Memory Usage | Notable Changes |
|---------|-----------|-------------------|--------------|-----------------|
| v1.11.0 | TBD | TBD | TBD | Current version |
| v1.10.0 | TBD | TBD | TBD | Previous version |
| v1.9.0 | TBD | TBD | TBD | Historical baseline |

### Alternative Solutions Comparison

*Future benchmarks should compare against alternative airport data solutions where applicable.*

### Performance Interpretation

When benchmark data becomes available, this section will provide contextual interpretation:

**For Small Applications (< 1,000 queries/day):**
- Expected performance characteristics
- Recommended usage patterns
- Memory considerations

**For Medium Applications (1,000 - 100,000 queries/day):**
- Scalability considerations
- Caching recommendations
- Performance optimization tips

**For High-Traffic Applications (> 100,000 queries/day):**
- Performance bottlenecks to expect
- Recommended architectural patterns
- When to consider alternatives

### Caveats and Limitations

- **Dataset Size:** Current benchmarks are based on 6,076 airports. Performance may vary with different dataset sizes.
- **Ruby Implementation:** Results may vary between different Ruby implementations (MRI, JRuby, TruffleRuby).
- **Hardware Dependency:** Performance is highly dependent on hardware specifications, particularly for cold start operations.
- **Memory vs. Speed Trade-off:** The library trades memory usage for query speed by loading all data into memory.
- **Search Algorithm:** Current implementation uses linear search for ICAO, city, and country lookups, which may not scale linearly.

### Contributing Benchmarks

We welcome community contributions of performance benchmarks. To contribute:

1. **Use the standardized methodology** described above
2. **Include full environment specifications** (hardware, OS, Ruby version)
3. **Provide raw data and analysis scripts** for reproducibility
4. **Test across multiple runs** to account for variance
5. **Document any modifications** to the standard methodology

To submit benchmarks, please:
- Create a new issue with the "benchmark" label
- Include all methodology details and raw results
- Provide scripts or code used for benchmarking
- Consider submitting a pull request with updates to this README section

**Example benchmark script structure:**
```ruby
require 'benchmark'
require 'airports'

# Benchmark cold start
cold_start_time = Benchmark.realtime do
  # Fresh require and first query
end

# Benchmark warm queries
warm_queries = Benchmark.realtime do
  # Repeated queries after warmup
end

# Memory profiling example
require 'memory_profiler'
report = MemoryProfiler.report do
  # Operations to profile
end
```

For questions about benchmarking methodology or to discuss performance optimization, please open an issue in the repository.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

To update the data included in the gem, just run `bundle exec rake update` and make a pull request with the changes. This will pull the latest data from [OpenFlights](http://openflights.org).

Bug reports and pull requests are welcome on GitHub at https://github.com/timrogers/airports. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://contributor-covenant.org) code of conduct.

## Acknowledgements

Big thanks to [OpenFlights](http://openflights.org) for collecting and making this data available. Check out their website for additional data about airlines, routes etc.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

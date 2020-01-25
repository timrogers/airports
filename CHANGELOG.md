# v1.6.0 (25 January 2020)

* Update airport data with the latest from [OpenFlights](http://openflights.org)
* Refactor how incorrect or missing data from OpenFlights is patched (@MatjazKavcic)

# v1.5.0 (5 December 2019)

* Support looking up airports by the name of the city they
are located in with `Airports.find_all_by_city_name` (@viral810, @timrogers)
* Refactor `Airports` so `Airport` objects are only generated once
and the code is cleaner (@timrogers)

# v1.4.1 (14 November 2019)

* Correct the time zone of Istanbul Airport (`IST`) (@aliismayilov)
* Correct the name of Aviador Carlos Campos Airport (`CPC`) (@jpgarritano)

# v1.4.0 (30 June 2019)

* Drop support for Ruby 2.2 and 2.3, which are no longer officially supported (@timrogers)
* Test against Ruby 2.6 (@timrogers)
* Convert "nulls" in the source data, expressed as "\\N", to Ruby `nil`s (@gabebw)

# v1.3.0 (26 June 2019)

* Expose the time zone that an airport is located in with `#tz_name` (@gabebw)

# v1.2.0 (11 March 2018)

* Drop support for Ruby 2.2, which has reached end-of-life and no longer receives security updates (@timrogers)
* Enforce code style using Rubocop (@timrogers)

# v1.1.0 (11 March 2018)

* Add new `.find_by_icao_code` for finding airports by their ICAO code (@ryanburnette)

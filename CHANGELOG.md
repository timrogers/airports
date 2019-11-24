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

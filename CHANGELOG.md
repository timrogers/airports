## v1.13.0 (TBD)

- Upgrade Ruby to 3.4.1 and drop support for Ruby 2.6, 2.7 which are EOL
- Update minimum required Ruby version to 3.0

## v1.11.0 (24 March, 2025)

- Add Monmouth Executive Airport (BLM) (@FinnLawrence)

## v1.10.0 (29 November, 2024)

- Add new `.icao_codes` method (@FinnLawrence)

## v1.9.0 (4 May, 2024)

- Add new `.find_all_by_country_name` method (@wilburhimself)

## v1.8.3 (31 March, 2024)

- Add Kertajati International Airport (KJT) (@chakraskun)

## v1.8.2 (22 March, 2024)

- Add the new Tulum Airport (TQO) (@rmm5t)

## v1.8.1 (17 February 2023)

- Fix the name of Tromsø Airport (TOS) (@pcothenet)

## v1.8.0 (13 March 2022)

- Add support for Ruby 3.1 (@timrogers)
- Fix the names of Ningbo (NGB) and Changsha (CSX) airports in China (@ratazzi)

# v1.7.0 (25 August 2021)

- Add support for Ruby 3.0 (@timrogers, with thanks to @kleinjm)
- Add Misrata Airport (`MRA`) in Libya (@timrogers, with thanks to @a21-kevin)
- Drop support for Ruby 2.4 and 2.5, which are no longer officially supported (@timrogers)
- Remove unnecessary dependencies from the gemspec, moving them to the `Gemfile` (@timrogers)

# v1.6.1 (9 May 2020)

- Add an entry for Berlin Brandenburg Airport (`BER`), which is missing from [OpenFlights](http://openflights.org) (@PavelWeSki)
- Update airport data with the latest from [OpenFlights](http://openflights.org)

# v1.6.0 (25 January 2020)

- Update airport data with the latest from [OpenFlights](http://openflights.org)
- Refactor how incorrect or missing data from OpenFlights is patched (@MatjazKavcic)

# v1.5.0 (5 December 2019)

- Support looking up airports by the name of the city they
  are located in with `Airports.find_all_by_city_name` (@viral810, @timrogers)
- Refactor `Airports` so `Airport` objects are only generated once
  and the code is cleaner (@timrogers)

# v1.4.1 (14 November 2019)

- Correct the time zone of Istanbul Airport (`IST`) (@aliismayilov)
- Correct the name of Aviador Carlos Campos Airport (`CPC`) (@jpgarritano)

# v1.4.0 (30 June 2019)

- Drop support for Ruby 2.2 and 2.3, which are no longer officially supported (@timrogers)
- Test against Ruby 2.6 (@timrogers)
- Convert "nulls" in the source data, expressed as "\\N", to Ruby `nil`s (@gabebw)

# v1.3.0 (26 June 2019)

- Expose the time zone that an airport is located in with `#tz_name` (@gabebw)

# v1.2.0 (11 March 2018)

- Drop support for Ruby 2.2, which has reached end-of-life and no longer receives security updates (@timrogers)
- Enforce code style using Rubocop (@timrogers)

# v1.1.0 (11 March 2018)

- Add new `.find_by_icao_code` for finding airports by their ICAO code (@ryanburnette)

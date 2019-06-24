module Airports
  class Airport
    attr_reader :name, :city, :country, :iata, :icao, :latitude, :longitude,
                :altitude, :timezone, :dst, :tz_name

    def initialize(name:, city:, country:, iata:, icao:, latitude:, longitude:,
                   altitude:, timezone:, dst:, tz_name:)
      @name = name
      @city = city
      @country = country
      @iata = iata
      @icao = icao
      @latitude = latitude
      @longitude = longitude
      @altitude = altitude
      @timezone = timezone
      @dst = dst
      @tz_name = tz_name
    end
  end
end
